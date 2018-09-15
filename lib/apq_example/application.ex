defmodule ApqExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: ApqExample.Worker.start_link(arg)
      Plug.Adapters.Cowboy2.child_spec(
        scheme: :http,
        plug: ApqExample.Router,
        options: [port: 4001]
      ),
      worker(Cachex, [:apq_cache, [limit: 100]])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApqExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
