defmodule Factual.Repo.Migrations.CreateBookmarksTable do
  use Ecto.Migration

  def change do
    create table(:bookmarks, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:user_id, references(:users, primary_key: true, on_delete: :delete_all))
      add(:url, :binary)
      timestamps()
    end
  end
end
