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
  painting: "Wasserschlangen II (Water Serpents II)",
  image: "wasserschlangen_ii.jpg",
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
  auction_house: "Private sale via Yves Bouvier",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 194_000_000,
  original_price: 180_000_000,
  painting: "Pendant portraits of Maerten Soolmans and Oopjen Coppit",
  image: "maerten_soolmans_oopjen_coppit.jpg",
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

%Painting{
  adjusted_price: 177_600_000,
  original_price: 140_000_000,
  painting: "No. 5, 1948",
  image: "no._5_1948.jpg",
  artist: "Jackson Pollock",
  year_start: 1948,
  year_end: 1948,
  date_of_sale_year: 20016,
  date_of_sale_month: 11,
  date_of_sale_day: 2,
  seller: "David Geffen",
  buyer: "David Martinez",
  auction_house: "Private sale via Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 174_400_000,
  original_price: 137_500_000,
  painting: "Woman III",
  image: "woman_iii.jpg",
  artist: "Willem de Kooning",
  year_start: 1953,
  year_end: 1953,
  date_of_sale_year: 20016,
  date_of_sale_month: 11,
  date_of_sale_day: 18,
  seller: "David Geffen",
  buyer: "Steven A. Cohen",
  auction_house: "Private sale via Larry Gagosian",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 172_100_000,
  original_price: 165_000_000,
  painting: "Masterpiece",
  image: "masterpiece.jpg",
  artist: "Roy Lichtenstein",
  year_start: 1962,
  year_end: 1962,
  date_of_sale_year: 2017,
  date_of_sale_month: 1,
  date_of_sale_day: 0,
  seller: "Agnes Gund",
  buyer: "Steven A. Cohen",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 171_200_000,
  original_price: 135_000_000,
  painting: "Portrait of Adele Bloch-Bauer I",
  image: "portrait_of_adele_bloch_bauer_i.jpg",
  artist: "Gustav Klimt",
  year_start: 1907,
  year_end: 1907,
  date_of_sale_year: 2006,
  date_of_sale_month: 6,
  date_of_sale_day: 18,
  seller: "Maria Altmann",
  buyer: "Ronald Lauder, Neue Galerie",
  auction_house: "Private sale via Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 170_100_000,
  original_price: 155_000_000,
  painting: "Le Rêve",
  image: "le_reve.jpg",
  artist: "Pablo Picasso",
  year_start: 1932,
  year_end: 1932,
  date_of_sale_year: 2013,
  date_of_sale_month: 3,
  date_of_sale_day: 26,
  seller: "Steve Wynn",
  buyer: "Steven A. Cohen",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 161_400_000,
  original_price: 82_500_000,
  painting: "Portrait of Dr. Gachet",
  image: "portrait_of_dr._gachet.jpg",
  artist: "Vincent van Gogh",
  year_start: 1890,
  year_end: 1890,
  date_of_sale_year: 1990,
  date_of_sale_month: 5,
  date_of_sale_day: 15,
  seller: "Siegfried Kramarsky heirs",
  buyer: "Ryoei Saito",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 160_100_000,
  original_price: 157_200_000,
  painting: "Nu couché (sur le côté gauche)",
  image: "nu_couche_sur_le_cote_gauche.jpg",
  artist: "Amedeo Modigliani",
  year_start: 1917,
  year_end: 1917,
  date_of_sale_year: 2018,
  date_of_sale_month: 5,
  date_of_sale_day: 15,
  seller: "Ezra and David Nahmad",
  buyer: "",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 159_800_000,
  original_price: 150_000_000,
  painting: "Adele Bloch-Bauer II",
  image: "adele_bloch_bauer_ii.jpg",
  artist: "Gustav Klimt",
  year_start: 1912,
  year_end: 1912,
  date_of_sale_year: 2016,
  date_of_sale_month: 0,
  date_of_sale_day: 0,
  seller: "Oprah Winfrey",
  buyer: "Unidentified buyer in China",
  auction_house: "Private sale via Larry Gagosian",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 156_300_000,
  original_price: 142_400_000,
  painting: "Three Studies of Lucian Freud",
  image: "three_studies_of_lucian_freud.jpg",
  artist: "Francis Bacon",
  year_start: 1969,
  year_end: 1969,
  date_of_sale_year: 2013,
  date_of_sale_month: 11,
  date_of_sale_day: 12,
  seller: "",
  buyer: "Elaine Wynn, ex-wife of Steve Wynn",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 152_800_000,
  original_price: 78_100_000,
  painting: "Bal du moulin de la Galette (small version)",
  image: "bal_du_moulin_de_la_galette.jpg",
  artist: "Pierre-Auguste Renoir",
  year_start: 1876,
  year_end: 1876,
  date_of_sale_year: 1990,
  date_of_sale_month: 5,
  date_of_sale_day: 17,
  seller: "Betsey Whitney",
  buyer: "Ryoei Saito",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 146_900_000,
  original_price: 140_800_000,
  painting: "Twelve Landscape Screens",
  image: "twelve_landscape_screens.jpg",
  artist: "Qi Baishi",
  year_start: 1925,
  year_end: 1925,
  date_of_sale_year: 2017,
  date_of_sale_month: 12,
  date_of_sale_day: 17,
  seller: "",
  buyer: "",
  auction_house: "Beijing Poly Auction",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 141_000_000,
  original_price: 104_200_000,
  painting: "Garçon à la Pipe (Boy with a Pipe)",
  image: "garcon_a_la_pipe.jpg",
  artist: "Pablo Picasso",
  year_start: 1905,
  year_end: 1905,
  date_of_sale_year: 2004,
  date_of_sale_month: 5,
  date_of_sale_day: 5,
  seller: "Greentree Foundation (Whitney family)",
  buyer: "Guido Barilla (not confirmed)",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 133_600_000,
  original_price: 119_900_000,
  painting: "The Scream",
  image: "the_scream.jpg",
  artist: "Edvard Munch",
  year_start: 1895,
  year_end: 1895,
  date_of_sale_year: 2012,
  date_of_sale_month: 5,
  date_of_sale_day: 2,
  seller: "Petter Olsen",
  buyer: "Leon Black",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 131_700_000,
  original_price: 120_000_000,
  painting: "Otahi",
  image: "otahi.jpg",
  artist: "Paul Gauguin",
  year_start: 1893,
  year_end: 1893,
  date_of_sale_year: 2013,
  date_of_sale_month: 0,
  date_of_sale_day: 0,
  seller: "Yves Bouvier",
  buyer: "Dmitry Rybolovlev",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 131_000_000,
  original_price: 118_000_000,
  painting: "Reclining Nude With Blue Cushion",
  image: "reclining_nude_with_blue_cushion.jpg",
  artist: "Amedeo Modigliani",
  year_start: 1917,
  year_end: 1917,
  date_of_sale_year: 2012,
  date_of_sale_month: 0,
  date_of_sale_day: 0,
  seller: "Steven A. Cohen",
  buyer: "Dmitry Rybolovlev",
  auction_house: "Private sale via Yves Bouvier",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 129_000_000,
  original_price: 110_000_000,
  painting: "Flag",
  image: "flag.jpg",
  artist: "Jasper Johns",
  year_start: 1958,
  year_end: 1958,
  date_of_sale_year: 2010,
  date_of_sale_month: 3,
  date_of_sale_day: 0,
  seller: "Jean-Christophe Castelli",
  buyer: "Steven A. Cohen",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 124_800_000,
  original_price: 106_500_000,
  painting: "Nude, Green Leaves and Bust",
  image: "nude_green_leaves_and_bust.jpg",
  artist: "Pablo Picasso",
  year_start: 1932,
  year_end: 1932,
  date_of_sale_year: 2010,
  date_of_sale_month: 5,
  date_of_sale_day: 4,
  seller: "Frances Lasker Brody estate",
  buyer: "Leonard Blavatnik (not confirmed)",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 123_800_000,
  original_price: 58_000_000,
  painting: "Portrait of Joseph Roulin",
  image: "portrait_of_joseph_roulin.jpg",
  artist: "Vincent van Gogh",
  year_start: 1889,
  year_end: 1889,
  date_of_sale_year: 1989,
  date_of_sale_month: 8,
  date_of_sale_day: 1,
  seller: "Private collection, Zürich",
  buyer: "Museum of Modern Art New York",
  auction_house: "Private sale via Thomas Ammann, Fine Art Zurich",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 121_300_000,
  original_price: 53_900_000,
  painting: "Irises",
  image: "irises.jpg",
  artist: "Vincent van Gogh",
  year_start: 1889,
  year_end: 1889,
  date_of_sale_year: 1987,
  date_of_sale_month: 11,
  date_of_sale_day: 11,
  seller: "John Whitney Payson, son of Joan Whitney Payson",
  buyer: "Alan Bond",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 120_800_000,
  original_price: 95_200_000,
  painting: "Dora Maar au Chat",
  image: "dora_maar_au_chat.jpg",
  artist: "Pablo Picasso",
  year_start: 1941,
  year_end: 1941,
  date_of_sale_year: 2006,
  date_of_sale_month: 5,
  date_of_sale_day: 3,
  seller: "Gidwitz family",
  buyer: "Boris Ivanishvili",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 118_700_000,
  original_price: 100_000_000,
  painting: "Eight Elvises",
  image: "eight_elvises.jpg",
  artist: "Andy Warhol",
  year_start: 1963,
  year_end: 1963,
  date_of_sale_year: 2008,
  date_of_sale_month: 10,
  date_of_sale_day: 0,
  seller: "Annibale Berlingieri",
  buyer: "The State of Qatar (not confirmed)",
  auction_house: "Private sale via Philippe Ségalot",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 117_100_000,
  original_price: 115_000_000,
  painting: "Young Girl with a Flower Basket",
  image: "young_girl_with_a_flower_basket.jpg",
  artist: "Pablo Picasso",
  year_start: 1905,
  year_end: 1905,
  date_of_sale_year: 2018,
  date_of_sale_month: 5,
  date_of_sale_day: 8,
  seller: "David and Peggy Rockefeller",
  buyer: "The Nahmad family",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 116_000_000,
  original_price: 105_700_000,
  painting: "Anna's Light",
  image: "annas_light.jpg",
  artist: "Barnett Newman",
  year_start: 1968,
  year_end: 1968,
  date_of_sale_year: 2013,
  date_of_sale_month: 10,
  date_of_sale_day: 4,
  seller: "DIC Corp.",
  buyer: "",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 115_700_000,
  original_price: 105_400_000,
  painting: "Silver Car Crash (Double Disaster)",
  image: "silver_car_crash.jpg",
  artist: "Andy Warhol",
  year_start: 1963,
  year_end: 1963,
  date_of_sale_year: 2013,
  date_of_sale_month: 11,
  date_of_sale_day: 13,
  seller: "Sotheby's",
  buyer: "",
  auction_house: "",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 115_300_000,
  original_price: 110_500_000,
  painting: "Untitled",
  image: "untitled_basquiat.jpg",
  artist: "Jean-Michel Basquiat",
  year_start: 1982,
  year_end: 1982,
  date_of_sale_year: 2017,
  date_of_sale_month: 5,
  date_of_sale_day: 18,
  seller: "Basquiat family",
  buyer: "Yusaku Maezawa",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 110_700_000,
  original_price: 110_700_000,
  painting: "Meules",
  image: "meules.jpg",
  artist: "Claude Monet",
  year_start: 1890,
  year_end: 1890,
  date_of_sale_year: 2019,
  date_of_sale_month: 5,
  date_of_sale_day: 14,
  seller: "",
  buyer: "",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 112_200_000,
  original_price: 71_500_000,
  painting: "Portrait de l'artiste sans barbe",
  image: "portrait_de_l-artiste_sans_barbe.jpg",
  artist: "Vincent van Gogh",
  year_start: 1889,
  year_end: 1889,
  date_of_sale_year: 1998,
  date_of_sale_month: 11,
  date_of_sale_day: 19,
  seller: "Jacques Koerfer heirs",
  buyer: "",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 110_000_000,
  original_price: 100_000_000,
  painting: "La Montagne Sainte-Victoire vue du bosquet du Château Noir",
  image: "la_montagne_sainte_victoire_vue_du_bosquet_du_chateau_noir.jpg",
  artist: "Paul Cézanne",
  year_start: 1904,
  year_end: 1904,
  date_of_sale_year: 2013,
  date_of_sale_month: 0,
  date_of_sale_day: 0,
  seller: "Edsel and Eleanor Ford House",
  buyer: "State of Qatar",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 109_000_000,
  original_price: 76_700_000,
  painting: "Massacre of the Innocents",
  image: "massacre_of_the_innocents.jpg",
  artist: "Peter Paul Rubens",
  year_start: 1611,
  year_end: 1611,
  date_of_sale_year: 2002,
  date_of_sale_month: 7,
  date_of_sale_day: 10,
  seller: "An Austrian family",
  buyer: "Kenneth Thomson",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 102_900_000,
  original_price: 95_400_000,
  painting: "Nurse",
  image: "nurse.jpg",
  artist: "Roy Lichtenstein",
  year_start: 1964,
  year_end: 1964,
  date_of_sale_year: 2015,
  date_of_sale_month: 11,
  date_of_sale_day: 9,
  seller: "",
  buyer: "",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 102_500_000,
  original_price: 86_300_000,
  painting: "Triptych, 1976",
  image: "triptych_1976.jpg",
  artist: "Francis Bacon",
  year_start: 1976,
  year_end: 1976,
  date_of_sale_year: 2008,
  date_of_sale_month: 5,
  date_of_sale_day: 14,
  seller: "Jean-Pierre Moueix heirs",
  buyer: "Roman Abramovich",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 101_700_000,
  original_price: 49_300_000,
  painting: "Les Noces de Pierrette",
  image: "les_noces_de_pierrette.jpg",
  artist: "Pablo Picasso",
  year_start: 1905,
  year_end: 1905,
  date_of_sale_year: 1989,
  date_of_sale_month: 11,
  date_of_sale_day: 30,
  seller: "Fredrik Roos",
  buyer: "Tomonori Tsurumaki",
  auction_house: "Binoche et Godeau",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 101_500_000,
  original_price: 80_000_000,
  painting: "False Start",
  image: "false_start.jpg",
  artist: "Jasper Johns",
  year_start: 1959,
  year_end: 1959,
  date_of_sale_year: 2006,
  date_of_sale_month: 10,
  date_of_sale_day: 12,
  seller: "David Geffen",
  buyer: "Kenneth C. Griffin",
  auction_house: "Private sale via Richard Gray",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 100_900_000,
  original_price: 57_000_000,
  painting: "A Wheatfield with Cypresses",
  image: "a_wheatfield_with_cypresses.jpg",
  artist: "Vincent van Gogh",
  year_start: 1889,
  year_end: 1889,
  date_of_sale_year: 1993,
  date_of_sale_month: 5,
  date_of_sale_day: 0,
  seller: "Emil Georg Bührle's son",
  buyer: "Walter H. Annenberg",
  auction_house: "Private sale via Steven Mazoh",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 100_900_000,
  original_price: 85_000_000,
  painting: "Te Fare (La maison)",
  image: "te_fare.jpg",
  artist: "Paul Gauguin",
  year_start: 1892,
  year_end: 1892,
  date_of_sale_year: 2008,
  date_of_sale_month: 6,
  date_of_sale_day: 0,
  seller: "Yves Bouvier",
  buyer: "Dmitry Rybolovlev",
  auction_house: "Private sale",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 98_700_000,
  original_price: 47_800_000,
  painting: "Yo, Picasso",
  image: "yo_picasso.jpg",
  artist: "Pablo Picasso",
  year_start: 1901,
  year_end: 1901,
  date_of_sale_year: 1989,
  date_of_sale_month: 5,
  date_of_sale_day: 9,
  seller: "Wendell Cherry",
  buyer: "Stavros Niarchos",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 98_600_000,
  original_price: 80_000_000,
  painting: "Turquoise Marilyn",
  image: "turquoise_marilyn.jpg",
  artist: "Andy Warhol",
  year_start: 1964,
  year_end: 1964,
  date_of_sale_year: 2007,
  date_of_sale_month: 5,
  date_of_sale_day: 20,
  seller: "Stefan Edlis",
  buyer: "Steven A. Cohen",
  auction_house: "Private sale via Larry Gagosian",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 97_300_000,
  original_price: 70_000_000,
  painting: "Portrait of Alfonso d'Avalos with a Page",
  image: "portrait_of_alfonso_d_avalos.jpg",
  artist: "Titian",
  year_start: 1533,
  year_end: 1533,
  date_of_sale_year: 2003,
  date_of_sale_month: 11,
  date_of_sale_day: 0,
  seller: "AXA insurance company",
  buyer: "Getty Museum",
  auction_house: "Private sale via Hervé Aaron",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 96_800_000,
  original_price: 86_900_000,
  painting: "Orange, Red, Yellow",
  image: "orange_red_yellow.jpg",
  artist: "Mark Rothko",
  year_start: 1961,
  year_end: 1961,
  date_of_sale_year: 2012,
  date_of_sale_month: 5,
  date_of_sale_day: 8,
  seller: "David Pincus estate",
  buyer: "",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 95_700_000,
  original_price: 80_500_000,
  painting: "Le Bassin aux Nymphéas",
  image: "le_bassin_aux_nympheas.jpg",
  artist: "Claude Monet",
  year_start: 1919,
  year_end: 1919,
  date_of_sale_year: 2008,
  date_of_sale_month: 6,
  date_of_sale_day: 24,
  seller: "J. Irwin and Xenia S. Miller",
  buyer: "",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 93_600_000,
  original_price: 91_900_000,
  painting: "Chop Suey",
  image: "chop_suey.jpg",
  artist: "Edward Hopper",
  year_start: 1929,
  year_end: 1929,
  date_of_sale_year: 2018,
  date_of_sale_month: 11,
  date_of_sale_day: 13,
  seller: "Barney A. Ebsworth estate",
  buyer: "",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 92_900_000,
  original_price: 60_500_000,
  painting: "Rideau, Cruchon et Compotier",
  image: "rideau_cruchon_et_compotier.jpg",
  artist: "Paul Cézanne",
  year_start: 1894,
  year_end: 1894,
  date_of_sale_year: 1999,
  date_of_sale_month: 5,
  date_of_sale_day: 10,
  seller: "Whitney Family",
  buyer: "Sotheby's",
  auction_house: "",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 91_900_000,
  original_price: 90_300_000,
  painting: "Portrait of an Artist (Pool with Two Figures)",
  image: "portrait_of_an_artist_pool_with_two_figures.jpg",
  artist: "David Hockney",
  year_start: 1972,
  year_end: 1972,
  date_of_sale_year: 2018,
  date_of_sale_month: 11,
  date_of_sale_day: 15,
  seller: "",
  buyer: "",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 90_900_000,
  original_price: 84_200_000,
  painting: "Black Fire I",
  image: "black_fire_i.jpg",
  artist: "Barnett Newman",
  year_start: 1961,
  year_end: 1961,
  date_of_sale_year: 2014,
  date_of_sale_month: 5,
  date_of_sale_day: 13,
  seller: "Private Collection",
  buyer: "Anonymous",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 89_800_000,
  original_price: 72_800_000,
  painting: "White Center (Yellow, Pink and Lavender on Rose)",
  image: "white_center_yellow_pink_and_lavender_on_rose.jpg",
  artist: "Mark Rothko",
  year_start: 1950,
  year_end: 1950,
  date_of_sale_year: 2007,
  date_of_sale_month: 5,
  date_of_sale_day: 15,
  seller: "David Rockefeller, Sr.",
  buyer: "Sheikh Hamad bin Khalifa Al-Thani",
  auction_house: "Sotheby's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 89_300_000,
  original_price: 39_700_000,
  painting: "Vase with Fifteen Sunflowers",
  image: "vase_with_fifteen_sunflowers.jpg",
  artist: "Vincent van Gogh",
  year_start: 1889,
  year_end: 1889,
  date_of_sale_year: 1987,
  date_of_sale_month: 3,
  date_of_sale_day: 30,
  seller: "Helen Beatty, daughter-in-law of Chester Beatty",
  buyer: "Yasuo Goto, Yasuda Comp.",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 88_800_000,
  original_price: 88_800_000,
  painting: "Buffalo II",
  image: "buffalo_ii.jpg",
  artist: "Robert Rauschenberg",
  year_start: 1964,
  year_end: 1964,
  date_of_sale_year: 2019,
  date_of_sale_month: 5,
  date_of_sale_day: 15,
  seller: "Robert and Beatrice Mayer Estate",
  buyer: "Alice Walton",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 88_500_000,
  original_price: 81_900_000,
  painting: "Triple Elvis",
  image: "triple_elvis.jpg",
  artist: "Andy Warhol",
  year_start: 1963,
  year_end: 1964,
  date_of_sale_year: 2014,
  date_of_sale_month: 11,
  date_of_sale_day: 12,
  seller: "WestSpiel",
  buyer: "",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 88_400_000,
  original_price: 71_700_000,
  painting: "Green Car Crash (Green Burning Car I)",
  image: "green_car_crash.jpg",
  artist: "Andy Warhol",
  year_start: 1963,
  year_end: 1963,
  date_of_sale_year: 2007,
  date_of_sale_month: 5,
  date_of_sale_day: 16,
  seller: "Private collection, Zürich",
  buyer: "Philip Niarchos",
  auction_house: "Christie's",
}
|> Repo.insert!()

%Painting{
  adjusted_price: 88_400_000,
  original_price: 81_900_000,
  painting: "No. 10",
  image: "no._10.jpg",
  artist: "Mark Rothko",
  year_start: 1958,
  year_end: 1958,
  date_of_sale_year: 2015,
  date_of_sale_month: 5,
  date_of_sale_day: 13,
  seller: "",
  buyer: "",
  auction_house: "Christie's",
}
|> Repo.insert!()

