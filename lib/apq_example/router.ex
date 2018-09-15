defmodule ApqExample.Router do
  use Plug.Router
  plug(Corsica, origins: "*", allow_headers: :all)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    json_decoder: Jason
  )

  plug(:dispatch)

  match("/api",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [
      schema: ApqExample.Schema,
      json_codec: Jason,
      interface: :playground,
      document_providers: [ApqExample.Apq, Absinthe.Plug.DocumentProvider.Default]
    ]
  )
end
