defmodule MepsWeb.MepsLive do
  use MepsWeb, :live_view

  alias Meps.Paintings

  def mount(_params, _session, socket) do
    paintings = Paintings.list_paintings_without_sleep()
    socket = assign(socket,
      options_artist: options_artist(paintings),
      options_century: options_century(paintings),
    )
    {:ok, socket, temporary_assigns: [paintings: []]}
  end

  ### HANDLE PARAMS ###

  def handle_params(params, _uri, socket) do
    IO.puts "--> params: #{inspect params}"
    artist = get_params_artist(params["artist"])
    century = get_params_century(params["century"])

    IO.puts "--> artist: #{inspect artist}"
    IO.puts "--> century: #{inspect century}"

    send_message(artist, century)

    socket = assign(socket,
      loading: true,
      paintings: [],
      selected_artist: artist,
      selected_century: century
    )

    {:noreply, socket}
  end

  defp get_params_artist(nil), do: nil
  defp get_params_artist(""), do: nil
  defp get_params_artist(artist), do: URI.decode(artist)

  defp get_params_century(nil), do: nil
  defp get_params_century(""), do: nil
  defp get_params_century(century), do: String.to_integer(century)

  ### SEND MESSAGE ###

  defp send_message(nil, nil) do
    send self(), {:clear}
  end

  defp send_message(artist, nil) do
    send self(), {:filter_by_artist, artist}
  end

  defp send_message(nil, century) do
    send self(), {:filter_by_century, century}
  end

  ### HANDLE INFO ###

  def handle_info({:filter_by_artist, artist}, socket) do
    case Paintings.list_by_artist(artist) do
      [] ->
        socket =
          socket
          |> put_flash(:info, "Couldn't find any painting for artist: #{artist}")
          |> assign(loading: false, paintings: [])
        {:noreply, socket}
      paintings ->
        socket = assign(socket, loading: false, paintings: paintings)
        {:noreply, socket}
    end
  end

  def handle_info({:filter_by_century, century}, socket) do
    case Paintings.list_by_century(century) do
      [] ->
        {:ok, century_ordinal} = Meps.Cldr.Number.to_string century, format: :ordinal
        socket =
          socket
          |> put_flash(:info, "Couldn't find any painting for #{century_ordinal} century")
          |> assign(loading: false, paintings: [])
        {:noreply, socket}
      paintings ->
        socket = assign(socket, loading: false, paintings: paintings)
        {:noreply, socket}
    end
  end

  def handle_info({:clear}, socket) do
    paintings = Paintings.list_paintings()
    socket = assign(socket, loading: false, paintings: paintings)
    {:noreply, socket}
  end

  ### HANDLE EVENTS ###

  def handle_event("filter_by_artist", %{"artist" => artist}, socket) do
    artist = URI.encode(artist)
    socket = push_patch socket, to: Routes.live_path(socket, __MODULE__, artist: artist, century: "")
    {:noreply, socket}
  end

  def handle_event("filter_by_century", %{"century" => century}, socket) do
    socket = push_patch socket, to: Routes.live_path(socket, __MODULE__, artist: "", century: century)
    {:noreply, socket}
  end

  def handle_event("clear", _, socket) do
    socket = push_patch socket, to: Routes.live_path(socket, __MODULE__, artist: "", century: "")
    {:noreply, socket}
  end

  ### HELPERS ###

  defp price_in_millions(price) do
    if rem(price, 1_000_000) == 0 do
      price
      |> div(1_000_000)
      |> Number.Currency.number_to_currency(precision: 0)
    else
      price / 1_000_000
      |> Number.Currency.number_to_currency(precision: 1)
    end
  end

  defp year(year_start, year_end) do
    if year_start == year_end do
      year_start
    else
      "#{year_start}/#{year_end}"
    end
  end

  defp month_number_to_name(number) do
    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    Enum.at(months, number - 1)
  end

  defp date_of_sale(year, month, day) do
    case {year, month, day} do
      {year, 0, 0} ->
        year
      {year, month, 0} ->
        "#{month_number_to_name month} #{year}"
      {year, month, day} ->
        "#{month_number_to_name month} #{day}, #{year}"
    end
  end

  defp options_artist(paintings) do
    for painting <- paintings do
      {painting.artist, painting.artist}
    end
    |> Enum.uniq
    |> Enum.sort
    |> List.insert_at(0, {"-All Artists-", ""})
  end

  defp options_century(paintings) do
    for painting <- paintings do
      century_year_start = year_to_century(painting.year_start)
      {:ok, century_ordinal_year_start} = Meps.Cldr.Number.to_string century_year_start, format: :ordinal

      century_year_end = year_to_century(painting.year_end)
      {:ok, century_ordinal_year_end} = Meps.Cldr.Number.to_string century_year_end, format: :ordinal

      [{century_ordinal_year_start, century_year_start}, {century_ordinal_year_end, century_year_end}]
    end
    |> Enum.concat
    |> Enum.uniq
    |> Enum.sort(:desc)
    |> List.insert_at(0, {"-All Centuries-", ""})
  end

  defp year_to_century(year) do
    if rem(year, 100) == 0, do: div(year, 100), else: div(year, 100) + 1
  end

end