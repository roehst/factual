defmodule Factual.Commands.CreateUser do
  alias Factual.Projections.User
  alias Factual.Repo
  alias Factual.Projections

  def create_user(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        Projections.update(%{type: "user_created", email: email})

      %User{} ->
        {:error, "User already exists"}
    end
  end
end
