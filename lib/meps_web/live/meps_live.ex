defmodule MepsWeb.MepsLive do
  use MepsWeb, :live_view

  alias Meps.Paintings

  def mount(_params, _session, socket) do
    paintings = Paintings.list_paintings()
    socket = assign(socket,
      loading: false,
      options_artists: options_artists(paintings),
      selected_artist: "",
      paintings: paintings
    )
    {:ok, socket, temporary_assigns: [paintings: []]}
  end

  #___________________
  # Events

  def handle_event("filter", %{"artist" => artist}, socket) do
    send self(), {:filter_by_artist, artist}

    socket = assign(socket, loading: true)
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

  defp options_artists(paintings) do
    for painting <- paintings do
      {painting.artist, painting.artist}
    end
    |> Enum.uniq
    |> Enum.sort
    |> List.insert_at(0, {"-All Artists-", ""})
  end

  def render(assigns) do
    ~L"""
    <div class="paintings">
      <form phx-change="filter">
        <select name="artist">
        <%= options_for_select(@options_artists, @selected_artist) %>
        </select>
      </form>

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
          <div class="original_price">
            Original Price: <%= price_in_millions(painting.original_price) %> million
          </div>
          <div class="title">Title: <%= painting.painting %></div>
          <div class="artist">Artist: <%= painting.artist %></div>
          <div class="year">Year: <%= year(painting.year_start, painting.year_end) %></div>
          <div class="date_of_sale">Date of Sale: <%= date_of_sale(painting.date_of_sale_year, painting.date_of_sale_month, painting.date_of_sale_day) %></div>
          <div>Seller: <%= painting.seller %></div>
          <div>Buyer: <%= painting.buyer %></div>
          <div>Auction House: <%= painting.auction_house %></div>
        </li>
        <% end  %>
      </ul>
    </div>

    """
  end

end