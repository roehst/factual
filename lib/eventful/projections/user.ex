defmodule Factual.Projections.User do
  use Ecto.Schema
  alias __MODULE__, as: User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:email, :string)
    timestamps()
  end

  def update(%{"type" => "user_created", "email" => email}) do
    Factual.Repo.insert(%User{email: email})
  end

  def update(%{"type" => "user_deleted", "email" => email}) do
    case Factual.Repo.get_by(User, email: email) do
      %User{} = user -> Factual.Repo.delete(user)
    end
  end
end
