defmodule Web.Router do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  plug(Absinthe.Plug, schema: Factual.Schema)

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: Factual.Schema, interface: :simple]
  )
end
