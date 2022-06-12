defmodule Factual.Event do
  use Ecto.Schema

  schema "events" do
    field(:data, :map)
    timestamps()
  end
end
