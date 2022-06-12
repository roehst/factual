defmodule Factual.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :user do
    field(:id, :id)
    field(:email, :string)
  end

  object :bookmark do
    field(:id, :id)
    field(:url, :string)
  end
end
