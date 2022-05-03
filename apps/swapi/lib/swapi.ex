defmodule Swapi do
  @moduledoc """
  Documentation for `Swapi`.

  Provides high level functions for interacting with the Star Wars API (SWAPI)
  """

  @doc """
  Hello world.

  ## Examples

      iex> Swapi.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Refreshes the SWAPI Postgres caches
  """
  def refresh_caches() do
    [
      fn -> Swapi.FilmsCollector.refresh_cache() end,
      fn -> Swapi.PeopleCollector.refresh_cache() end,
      fn -> Swapi.PlanetsCollector.refresh_cache() end,
      fn -> Swapi.SpeciesCollector.refresh_cache() end,
      fn -> Swapi.StarshipsCollector.refresh_cache() end,
      fn -> Swapi.VehiclesCollector.refresh_cache() end,

    ]
    |> Task.async_stream(fn function -> function.() end)
    |> Enum.to_list()
  end

  @doc """
  Defines a Stream.resource that will retrieve planets from SWAPI as a stream
  """
  def stream_planets() do
    Stream.resource(
      fn -> Finch.build(:get, "https://swapi.dev/api/planets") |> Finch.request(SwapiFinch) end,
      fn
        nil -> {:halt, nil}
        request -> handle_next(request)
      end,
      fn _request -> nil end
    )
  end

  @doc """
  Defines a Stream.resource that will retrieve people from SWAPI as a stream
  """
  def stream_people() do
    Stream.resource(
      fn -> Finch.build(:get, "https://swapi.dev/api/people") |> Finch.request(SwapiFinch) end,
      fn
        nil -> {:halt, nil}
        request -> handle_next(request)
      end,
      fn _request -> nil end
    )
  end

  @doc """
  Defines a Stream.resource that will retrieve films from SWAPI as a stream
  """
  def stream_films() do
    Stream.resource(
      fn -> Finch.build(:get, "https://swapi.dev/api/films") |> Finch.request(SwapiFinch) end,
      fn
        nil -> {:halt, nil}
        request -> handle_next(request)
      end,
      fn _request -> nil end
    )
  end

  @doc """
  Defines a Stream.resource that will retrieve species from SWAPI as a stream
  """
  def stream_species() do
    Stream.resource(
      fn -> Finch.build(:get, "https://swapi.dev/api/species") |> Finch.request(SwapiFinch) end,
      fn
        nil -> {:halt, nil}
        request -> handle_next(request)
      end,
      fn _request -> nil end
    )
  end

  @doc """
  Defines a Stream.resource that will retrieve starships from SWAPI as a stream
  """
  def stream_starships() do
    Stream.resource(
      fn -> Finch.build(:get, "https://swapi.dev/api/starships") |> Finch.request(SwapiFinch) end,
      fn
        nil -> {:halt, nil}
        request -> handle_next(request)
      end,
      fn _request -> nil end
    )
  end

  @doc """
  Defines a Stream.resource that will retrieve vehicles from SWAPI as a stream
  """
  def stream_vehicles() do
    Stream.resource(
      fn -> Finch.build(:get, "https://swapi.dev/api/vehicles") |> Finch.request(SwapiFinch) end,
      fn
        nil -> {:halt, nil}
        request -> handle_next(request)
      end,
      fn _request -> nil end
    )
  end

  defp handle_next({:ok, %{body: body, status: 200}}) do
    body = body |> Jason.decode!()

    case body["next"] do
      nil -> {body["results"], nil}
      _ -> {body["results"], Finch.build(:get, body["next"]) |> Finch.request(SwapiFinch)}
    end
  end
end
