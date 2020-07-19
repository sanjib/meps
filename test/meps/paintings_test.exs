defmodule Meps.PaintingsTest do
  use Meps.DataCase

  alias Meps.Paintings

  describe "paintings" do
    alias Meps.Paintings.Painting

    @valid_attrs %{adjusted_price: 42, artist: "some artist", auction_house: "some auction_house", buyer: "some buyer", date_of_sale_day: 42, date_of_sale_month: 42, date_of_sale_year: 42, image: "some image", original_price: 42, painting: "some painting", seller: "some seller", year_end: 42, year_start: 42}
    @update_attrs %{adjusted_price: 43, artist: "some updated artist", auction_house: "some updated auction_house", buyer: "some updated buyer", date_of_sale_day: 43, date_of_sale_month: 43, date_of_sale_year: 43, image: "some updated image", original_price: 43, painting: "some updated painting", seller: "some updated seller", year_end: 43, year_start: 43}
    @invalid_attrs %{adjusted_price: nil, artist: nil, auction_house: nil, buyer: nil, date_of_sale_day: nil, date_of_sale_month: nil, date_of_sale_year: nil, image: nil, original_price: nil, painting: nil, seller: nil, year_end: nil, year_start: nil}

    def painting_fixture(attrs \\ %{}) do
      {:ok, painting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Paintings.create_painting()

      painting
    end

    test "list_paintings/0 returns all paintings" do
      painting = painting_fixture()
      assert Paintings.list_paintings() == [painting]
    end

    test "get_painting!/1 returns the painting with given id" do
      painting = painting_fixture()
      assert Paintings.get_painting!(painting.id) == painting
    end

    test "create_painting/1 with valid data creates a painting" do
      assert {:ok, %Painting{} = painting} = Paintings.create_painting(@valid_attrs)
      assert painting.adjusted_price == 42
      assert painting.artist == "some artist"
      assert painting.auction_house == "some auction_house"
      assert painting.buyer == "some buyer"
      assert painting.date_of_sale_day == 42
      assert painting.date_of_sale_month == 42
      assert painting.date_of_sale_year == 42
      assert painting.image == "some image"
      assert painting.original_price == 42
      assert painting.painting == "some painting"
      assert painting.seller == "some seller"
      assert painting.year_end == 42
      assert painting.year_start == 42
    end

    test "create_painting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Paintings.create_painting(@invalid_attrs)
    end

    test "update_painting/2 with valid data updates the painting" do
      painting = painting_fixture()
      assert {:ok, %Painting{} = painting} = Paintings.update_painting(painting, @update_attrs)
      assert painting.adjusted_price == 43
      assert painting.artist == "some updated artist"
      assert painting.auction_house == "some updated auction_house"
      assert painting.buyer == "some updated buyer"
      assert painting.date_of_sale_day == 43
      assert painting.date_of_sale_month == 43
      assert painting.date_of_sale_year == 43
      assert painting.image == "some updated image"
      assert painting.original_price == 43
      assert painting.painting == "some updated painting"
      assert painting.seller == "some updated seller"
      assert painting.year_end == 43
      assert painting.year_start == 43
    end

    test "update_painting/2 with invalid data returns error changeset" do
      painting = painting_fixture()
      assert {:error, %Ecto.Changeset{}} = Paintings.update_painting(painting, @invalid_attrs)
      assert painting == Paintings.get_painting!(painting.id)
    end

    test "delete_painting/1 deletes the painting" do
      painting = painting_fixture()
      assert {:ok, %Painting{}} = Paintings.delete_painting(painting)
      assert_raise Ecto.NoResultsError, fn -> Paintings.get_painting!(painting.id) end
    end

    test "change_painting/1 returns a painting changeset" do
      painting = painting_fixture()
      assert %Ecto.Changeset{} = Paintings.change_painting(painting)
    end
  end
end
