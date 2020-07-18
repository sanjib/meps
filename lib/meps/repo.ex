defmodule Meps.Repo do
  use Ecto.Repo,
    otp_app: :meps,
    adapter: Ecto.Adapters.Postgres
end
