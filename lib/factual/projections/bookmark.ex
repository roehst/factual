defmodule Factual.Projections.Bookmark do
  use Ecto.Schema

  alias Factual.Projections.User
  alias __MODULE__, as: Bookmark

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id
  schema "bookmarks" do
    field(:url, :string)
    belongs_to(:user, User)
    timestamps()
  end

  def select(event) do
    case event do
      %{"type" => type} when type in ~w(bookmark_created bookmark_deleted) ->
        true

      _ ->
        false
    end
  end

  def update(%{"type" => "bookmark_created", "id" => id, "url" => url, "user_id" => user_id}) do
    Factual.Repo.insert(%Bookmark{
      id: id,
      url: url,
      user_id: user_id
    })
  end

  def update(%{"type" => "bookmark_deleted", "id" => id}) do
    case Factual.Repo.get_by(Bookmark, id: id) do
      %Bookmark{} = bookmark -> Factual.Repo.delete(bookmark)
    end
  end
end
