defmodule Meps.Repo.Migrations.CreatePaintings do
  use Ecto.Migration

  def change do
    create table(:paintings) do
      add :adjusted_price, :integer
      add :original_price, :integer
      add :painting, :string
      add :image, :string
      add :artist, :string
      add :year_start, :integer
      add :year_end, :integer
      add :date_of_sale_year, :integer
      add :date_of_sale_month, :integer
      add :date_of_sale_day, :integer
      add :seller, :string
      add :buyer, :string
      add :auction_house, :string

      timestamps()
    end

  end
end
