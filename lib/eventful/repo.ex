defmodule Factual.Repo do
  use Ecto.Repo,
    otp_app: :factual,
    adapter: Ecto.Adapters.SQLite3
end
