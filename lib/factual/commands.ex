defmodule Factual.Commands do
  defdelegate create_user(email), to: Factual.Commands.CreateUser
  defdelegate create_bookmark(url, user_id), to: Factual.Commands.Bookmark
end
