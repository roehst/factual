defmodule Factual.Queries do
  alias Factual.{Repo, Projections}

  def list_bookmarks() do
    Repo.all(Projections.Bookmark)
  end

  def list_users() do
    Repo.all(Projections.User)
  end

  def list_user_bookmarks(user_id) do
    Projections.User
    |> Repo.get(user_id)
    |> Repo.preload(:bookmarks)
    |> then(& &1.bookmarks)
  end
end
