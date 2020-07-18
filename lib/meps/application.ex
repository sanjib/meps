defmodule Meps.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Meps.Repo,
      # Start the Telemetry supervisor
      MepsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Meps.PubSub},
      # Start the Endpoint (http/https)
      MepsWeb.Endpoint
      # Start a worker by calling: Meps.Worker.start_link(arg)
      # {Meps.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Meps.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MepsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
