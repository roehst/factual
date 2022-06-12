defmodule Web.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get _ do
    send_resp(conn, 200, "Ok")
  end
end
