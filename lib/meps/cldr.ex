defmodule Meps.Cldr do
  use Cldr,
      locales: ["en"],
      default_locale: "en",
      precompile_number_formats: ["#,##0"]
end
