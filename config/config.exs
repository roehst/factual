import Config

config :factual, Factual.Repo, database: "factual.sqlite3"

config :factual,
  ecto_repos: [Factual.Repo]
