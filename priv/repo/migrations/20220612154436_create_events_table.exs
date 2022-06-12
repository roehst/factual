defmodule Factual.Repo.Migrations.CreateEventsTable do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :data, :map
      timestamps()
    end
  end
end
