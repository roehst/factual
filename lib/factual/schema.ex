defmodule Factual.Schema do
  use Absinthe.Schema

  import_types(Factual.Schema.ContentTypes)

  alias Web.Resolvers

  query do
    @desc "Get all bookmarks"
    field :bookmarks, list_of(:bookmark) do
      resolve(&Resolvers.Content.list_bookmarks/3)
    end

    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.Content.list_users/3)
    end
  end
end
