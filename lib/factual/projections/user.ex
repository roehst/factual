defmodule Factual.Projections.User do
  use Ecto.Schema
  alias __MODULE__, as: User
  alias Factual.Projections.Bookmark

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id
  schema "users" do
    field(:email, :string)
    has_many(:bookmarks, Bookmark)
    timestamps()
  end

  def select(event) do
    case event do
      %{"type" => type} when type in ~w(user_created user_deleted) ->
        true

      _ ->
        false
    end
  end

  def update(%{"type" => "user_created", "id" => id, "email" => email}) do
    Factual.Repo.insert(%User{id: id, email: email})
  end

  def update(%{"type" => "user_deleted", "email" => email}) do
    case Factual.Repo.get_by(User, email: email) do
      %User{} = user -> Factual.Repo.delete(user)
    end
  end
end
