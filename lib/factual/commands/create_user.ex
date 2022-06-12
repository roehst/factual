defmodule Factual.Commands.CreateUser do
  alias Factual.Projections.User
  alias Factual.Repo
  alias Factual.Projections

  def create_user(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        id = Ecto.UUID.generate()
        Projections.update(%{type: "user_created", id: id, email: email})

      %User{} ->
        {:error, "User already exists"}
    end
  end
end
