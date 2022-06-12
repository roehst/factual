defmodule Web.Resolvers.Content do
  def list_bookmarks(_parent, _args, _resolution) do
    {:ok, Factual.Queries.list_bookmarks()}
  end

  def list_users(_parent, _args, _resolution) do
    {:ok, Factual.Queries.list_users()}
  end
end
