defmodule PhoenixOfficialGuide.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixOfficialGuideWeb.Telemetry,
      PhoenixOfficialGuide.Repo,
      {DNSCluster, query: Application.get_env(:phoenix_official_guide, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixOfficialGuide.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixOfficialGuide.Finch},
      # Start a worker by calling: PhoenixOfficialGuide.Worker.start_link(arg)
      # {PhoenixOfficialGuide.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixOfficialGuideWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixOfficialGuide.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixOfficialGuideWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
