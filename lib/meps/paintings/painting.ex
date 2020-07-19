defmodule Meps.Paintings.Painting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "paintings" do
    field :adjusted_price, :integer
    field :artist, :string
    field :auction_house, :string
    field :buyer, :string
    field :date_of_sale_day, :integer
    field :date_of_sale_month, :integer
    field :date_of_sale_year, :integer
    field :image, :string
    field :original_price, :integer
    field :painting, :string
    field :seller, :string
    field :year_end, :integer
    field :year_start, :integer

    timestamps()
  end

  @doc false
  def changeset(painting, attrs) do
    painting
    |> cast(attrs, [:adjusted_price, :original_price, :painting, :image, :artist, :year_start, :year_end, :date_of_sale_year, :date_of_sale_month, :date_of_sale_day, :seller, :buyer, :auction_house])
    |> validate_required([:adjusted_price, :original_price, :painting, :image, :artist, :year_start, :year_end, :date_of_sale_year, :date_of_sale_month, :date_of_sale_day, :seller, :buyer, :auction_house])
  end
end
