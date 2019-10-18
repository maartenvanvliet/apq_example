defmodule ApqExample.Apq do
  use Apq.DocumentProvider,
    cache_provider: ApqExample.Cache,
    json_codec: Jason
end
