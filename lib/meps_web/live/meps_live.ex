defmodule MepsWeb.MepsLive do
  use MepsWeb, :live_view

  alias Meps.Paintings

  def mount(_params, _session, socket) do
    paintings = Paintings.list_paintings()
    socket = assign(socket,
      loading: false,
      options_artist: options_artist(paintings),
      options_century: options_century(paintings),
      selected_artist: "",
      selected_century: "",
      paintings: paintings
    )
    {:ok, socket, temporary_assigns: [paintings: []]}
  end

  #___________________
  # Events

  def handle_event("filter_by_artist", %{"artist" => artist}, socket) do
    send self(), {:filter_by_artist, artist}
    socket = assign(socket, loading: true, selected_artist: artist, selected_century: "")
    {:noreply, socket}
  end

  def handle_event("filter_by_century", %{"century" => century}, socket) do
    century = if century != "", do: String.to_integer(century), else: ""
    send self(), {:filter_by_century, century}
    socket = assign(socket, loading: true, selected_artist: "", selected_century: century)
    {:noreply, socket}
  end

  def handle_event("clear", _, socket) do
    send self(), {:clear}
    socket = assign(socket, loading: true, selected_artist: "", selected_century: "")
    {:noreply, socket}
  end

  def handle_info({:filter_by_artist, artist}, socket) do
    paintings =
      case artist do
        "" ->
          Paintings.list_paintings()
        artist ->
          Paintings.list_by_artist(artist)
      end

    socket = assign(socket,
      loading: false,
      paintings: paintings
    )
    {:noreply, socket}
  end

  def handle_info({:filter_by_century, century}, socket) do
    paintings =
      case century do
        "" ->
          Paintings.list_paintings()
        artist ->
          Paintings.list_by_century(century)
      end

    socket = assign(socket,
      loading: false,
      paintings: paintings
    )
    {:noreply, socket}
  end

  def handle_info({:clear}, socket) do
    paintings = Paintings.list_paintings()

    socket = assign(socket,
      loading: false,
      paintings: paintings
    )
    {:noreply, socket}
  end

  #___________________
  # Helpers

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

  def render(assigns) do
    ~L"""
    <div class="paintings">
      <div class="filter_forms">
        <form phx-change="filter_by_artist">
          <select name="artist">
            <%= options_for_select(@options_artist, @selected_artist) %>
          </select>
        </form>
        <form phx-change="filter_by_century">
          <select name="century">
            <%= options_for_select(@options_century, @selected_century) %>
          </select>
        </form>
        <div class="clear"><a phx-click="clear" href="/#">Clear All</a></div>
        <div class="count">Found <%= length(@paintings) %> <%= Inflex.inflect("painting", length(@paintings)) %></div>
      </div>

      <%= if @loading do %>
        <div class="loader">
          <div class="bounce1"></div>
          <div class="bounce2"></div>
          <div class="bounce3"></div>
        </div>
      <% end %>

      <ul>
        <%= for painting <- @paintings do %>
        <li>
          <div class="image" style="background: url(/images/paintings/<%= painting.image %>);" onclick="window.open('/images/paintings/<%= painting.image %>')"></div>
          <div class="adjusted_price">
            <%= price_in_millions(painting.adjusted_price) %> million
          </div>
          <div class="title"><%= painting.painting %></div>
          <div class="artist">by <%= painting.artist %></div>
          <div class="original_price">
            <span>Original Price:</span> <%= price_in_millions(painting.original_price) %> million
          </div>
          <div class="year"><span>Year:</span> <%= year(painting.year_start, painting.year_end) %></div>
          <div class="date_of_sale"><span>Date of Sale:</span> <%= date_of_sale(painting.date_of_sale_year, painting.date_of_sale_month, painting.date_of_sale_day) %></div>
          <div><span>Seller:</span> <%= painting.seller %></div>
          <div><span>Buyer:</span> <%= painting.buyer %></div>
          <div><span>Auction House:</span> <%= painting.auction_house %></div>
        </li>
        <% end  %>
      </ul>
    </div>

    """
  end

end