defmodule Factual.Commands do
  defdelegate create_user(email), to: Factual.Commands.CreateUser
end
