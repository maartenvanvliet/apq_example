defmodule ApqExample.Apq do
  use Apq.DocumentProvider, cache_provider: ApqExample.Cache
end
