defmodule Web.SwapiVehiclesApiController do
  @moduledoc """
  This is the Controller for the "/api/vehicles" endpoint
  """
  use Web, :controller

  @doc """
  Lists vehicles from SWAPI
  """
  def list(conn, params) do
    results =
      Db.Repo.all(Swapi.Vehicles)
      |> Enum.map(fn struct -> struct |> Map.from_struct() |> Map.delete(:__meta__) end)

    json(conn, %{results: results})
  end
end
