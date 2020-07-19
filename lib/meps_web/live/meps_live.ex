defmodule MepsWeb.MepsLive do
  use MepsWeb, :live_view

  alias Meps.Paintings

  def mount(_params, _session, socket) do
    paintings = Paintings.list_paintings()
    socket = assign(socket,
      paintings: paintings
    )
    {:ok, socket, temporary_assigns: [paintings: []]}
  end

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

  def render(assigns) do
    ~L"""
    <br />
    <div class="paintings">
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