# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Meps.Repo.insert!(%Meps.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Meps.Repo
alias Meps.Paintings.Painting

#%Painting{
#  adjusted_price: 1_000_000,
#  original_price: 1_000_000,
#  painting: "",
#  image: "",
#  artist: "",
#  year_start: 0,
#  year_end: 0,
#  date_of_sale_year: 0,
#  date_of_sale_month: 0,
#  date_of_sale_day: 0,
#  seller: "",
#  buyer: "",
#  auction_house: "",
#}
#|> Repo.insert!()

%Painting{
  adjusted_price: 469_700_000,
  original_price: 450_300_000,
  painting: "Salvator Mundi",
  image: "salvator_mundi.jpg",
  artist: "Leonardo da Vinci",
  year_start: 1500,
  year_end: 1500,
  date_of_sale_year: 2017,
  date_of_sale_month: 11,
  date_of_sale_day: 15,
  seller: "Dmitry Rybolovlev",
  buyer: "Badr bin Abdullah Al Saud",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 324_000_000,
  original_price: 300_000_000,
  painting: "Interchange",
  image: "interchange.jpg",
  artist: "Willem de Kooning",
  year_start: 1955,
  year_end: 1955,
  date_of_sale_year: 2015,
  date_of_sale_month: 9,
  date_of_sale_day: 0,
  seller: "David Geffen Foundation",
  buyer: "Kenneth C. Griffin",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 284_000_000,
  original_price: 250_000_000,
  painting: "The Card Players",
  image: "the_card_players.jpg",
  artist: "Paul Cézanne",
  year_start: 1892,
  year_end: 1893,
  date_of_sale_year: 2011,
  date_of_sale_month: 4,
  date_of_sale_day: 0,
  seller: "George Embiricos",
  buyer: "State of Qatar",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 227_000_000,
  original_price: 210_000_000,
  painting: "Nafea Faa Ipoipo (When Will You Marry?)",
  image: "nafea_faa_ipoipo.jpg",
  artist: "Paul Gauguin",
  year_start: 1892,
  year_end: 1892,
  date_of_sale_year: 2014,
  date_of_sale_month: 9,
  date_of_sale_day: 0,
  seller: "Rudolf Staechelin heirs",
  buyer: "State of Qatar",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 216_000_000,
  original_price: 200_000_000,
  painting: "Number 17A",
  image: "number_17a.jpg",
  artist: "Jackson Pollock",
  year_start: 1948,
  year_end: 1948,
  date_of_sale_year: 2015,
  date_of_sale_month: 9,
  date_of_sale_day: 0,
  seller: "David Geffen Foundation",
  buyer: "Kenneth C. Griffin",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 201_700_000,
  original_price: 183_800_000,
  painting: "Wasserschlangen II",
  image: "wasserschlangen-ii.jpg",
  artist: "Gustav Klimt",
  year_start: 1904,
  year_end: 1907,
  date_of_sale_year: 2013,
  date_of_sale_month: 0,
  date_of_sale_day: 0,
  seller: "Yves Bouvier",
  buyer: "Dmitry Rybolovlev",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 201_000_000,
  original_price: 186_000_000,
  painting: "No. 6 (Violet, Green and Red)",
  image: "no._6.jpg",
  artist: "Mark Rothko",
  year_start: 1951,
  year_end: 1951,
  date_of_sale_year: 2014,
  date_of_sale_month: 8,
  date_of_sale_day: 0,
  seller: "Cherise Moueix",
  buyer: "Dmitry Rybolovlev",
  auction_house: "Yves Bouvier",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 194_000_000,
  original_price: 180_000_000,
  painting: "Pendant portraits of Maerten Soolmans and Oopjen Coppit",
  image: "maerten-soolmans-oopjen-coppit.jpg",
  artist: "Rembrandt",
  year_start: 1634,
  year_end: 1634,
  date_of_sale_year: 2015,
  date_of_sale_month: 9,
  date_of_sale_day: 0,
  seller: "Éric de Rothschild",
  buyer: "Rijksmuseum and Louvre",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 193_500_000,
  original_price: 179_400_000,
  painting: "Les Femmes d'Alger (\"Version O\")",
  image: "les_femmes_dalger.jpg",
  artist: "Pablo Picasso",
  year_start: 1955,
  year_end: 1955,
  date_of_sale_year: 2015,
  date_of_sale_month: 5,
  date_of_sale_day: 11,
  seller: "Private collection",
  buyer: "Hamad bin Jassim bin Jaber Al Thani",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 183_800_000,
  original_price: 170_400_000,
  painting: "Nu couché",
  image: "nu_couche.jpg",
  artist: "Amedeo Modigliani",
  year_start: 1917,
  year_end: 1918,
  date_of_sale_year: 2015,
  date_of_sale_month: 11,
  date_of_sale_day: 9,
  seller: "Laura Mattioli Rossi",
  buyer: "Liu Yiqian",
  auction_house: "Christie's",
}
|> Repo.insert!()

