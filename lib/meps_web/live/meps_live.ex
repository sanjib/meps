defmodule MepsWeb.MepsLive do
  use MepsWeb, :live_view

  alias Meps.Paintings

  def mount(_params, _session, socket) do
    paintings = Paintings.list_paintings()
    socket = assign(socket,
      options_artist: options_artist(paintings),
      options_century: options_century(paintings),
      options_sort: %{
        "Price (high to low)" => "price:desc",
        "Price (low to high)" => "price:asc",
        "Year (old to new)" => "year:asc",
        "Year (new to old)" => "year:desc",
      }
    )
    {:ok, socket, temporary_assigns: [paintings: []]}
  end

  ### HANDLE PARAMS ###

  def handle_params(params, _uri, socket) do
    artist = get_params_artist(params["artist"])
    century = get_params_century(params["century"])
    sort_by = get_params_sort_by(params["sort_by"])
    sort_order = get_params_sort_order(params["sort_order"])
    selected_sort = Atom.to_string(sort_by) <> ":" <> Atom.to_string(sort_order)

    send_message(artist, century, sort_by, sort_order)

    socket = assign(socket,
      loading: true,
      paintings: [],
      selected_artist: artist,
      selected_century: century,
      selected_sort: selected_sort
    )

    {:noreply, socket}
  end

  defp get_params_artist(nil), do: nil
  defp get_params_artist(""), do: nil
  defp get_params_artist(artist), do: URI.decode(artist)

  defp get_params_century(nil), do: nil
  defp get_params_century(""), do: nil
  defp get_params_century(century), do: String.to_integer(century)

  defp get_params_sort_by(nil), do: :price
  defp get_params_sort_by(""), do: :price
  defp get_params_sort_by(sort_by), do: sort_by |> String.to_atom

  defp get_params_sort_order(nil), do: :desc
  defp get_params_sort_order(""), do: :desc
  defp get_params_sort_order(sort_order), do: sort_order |> String.to_atom

  defp get_params_from_selected_sort(""), do: ["", ""]
  defp get_params_from_selected_sort(selected_sort), do: String.split(selected_sort, ":")

  ### SEND MESSAGE ###

  defp send_message(nil, nil, sort_by, sort_order) do
    send self(), {:clear, sort_by, sort_order}
  end

  defp send_message(artist, nil, sort_by, sort_order) do
    send self(), {:filter_by_artist, artist, sort_by, sort_order}
  end

  defp send_message(nil, century, sort_by, sort_order) do
    send self(), {:filter_by_century, century, sort_by, sort_order}
  end

  ### HANDLE INFO ###

  def handle_info({:filter_by_artist, artist, sort_by, sort_order}, socket) do
    case Paintings.list_by_artist(artist, sort_by, sort_order) do
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

  def handle_info({:filter_by_century, century, sort_by, sort_order}, socket) do
    case Paintings.list_by_century(century, sort_by, sort_order) do
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

  def handle_info({:clear, sort_by, sort_order}, socket) do
    paintings = Paintings.list_paintings(sort_by, sort_order)
    socket = assign(socket, loading: false, paintings: paintings)
    {:noreply, socket}
  end

  ### HANDLE EVENTS ###

  def handle_event("filter_by_artist", %{"artist" => artist}, socket) do
    artist = URI.encode(artist)
    [sort_by, sort_order] = get_params_from_selected_sort(socket.assigns.selected_sort)
    socket = push_patch socket, to: Routes.live_path(socket, __MODULE__,
      artist: artist,
      century: "",
      sort_by: sort_by,
      sort_order: sort_order
    )
    {:noreply, socket}
  end

  def handle_event("filter_by_century", %{"century" => century}, socket) do
    [sort_by, sort_order] = get_params_from_selected_sort(socket.assigns.selected_sort)
    socket = push_patch socket, to: Routes.live_path(socket, __MODULE__,
      artist: "",
      century: century,
      sort_by: sort_by,
      sort_order: sort_order
    )
    {:noreply, socket}
  end

  def handle_event("clear", _, socket) do
    socket = push_patch socket, to: Routes.live_path(socket, __MODULE__,
      artist: "",
      century: "",
      sort_by: "",
      sort_order: ""
    )
    {:noreply, socket}
  end

  def handle_event("sort", %{"sort" => sort}, socket) do
    [sort_by, sort_order] = get_params_from_selected_sort(sort)
    socket = push_patch socket, to: Routes.live_path(socket, __MODULE__,
      artist: socket.assigns.selected_artist,
      century: socket.assigns.selected_century,
      sort_by: sort_by,
      sort_order: sort_order
    )
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
    |> List.insert_at(0, {"All Artists", ""})
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
    |> List.insert_at(0, {"All Centuries", ""})
  end

  defp year_to_century(year) do
    if rem(year, 100) == 0, do: div(year, 100), else: div(year, 100) + 1
  end

end