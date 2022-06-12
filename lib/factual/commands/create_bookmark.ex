defmodule Factual.Commands.Bookmark do
  alias Factual.Projections.Bookmark
  alias Factual.Repo
  alias Factual.Projections

  def create_bookmark(url, user_id) do
    case Repo.get_by(Bookmark, url: url) do
      nil ->
        id = Ecto.UUID.generate()
        Projections.update(%{type: "bookmark_created", user_id: user_id, id: id, url: url})

      %Bookmark{} ->
        {:error, "This URL already has a bookmark"}
    end
  end
end
