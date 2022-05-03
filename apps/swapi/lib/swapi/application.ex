defmodule Swapi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Swapi.Worker.start_link(arg)
      # {Swapi.Worker, arg}
      {Finch, name: SwapiFinch},
      {Swapi.FilmsCollector, []},
      {Swapi.PeopleCollector, []},
      {Swapi.PlanetsCollector, []},
      {Swapi.SpeciesCollector, []},
      {Swapi.StarshipsCollector, []},
      {Swapi.VehiclesCollector, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Swapi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
