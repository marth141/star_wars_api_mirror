defmodule Web.SwapiSpeciesApiController do
  @moduledoc """
  This is the Controller for the "/api/species" endpoint
  """
  use Web, :controller

  @doc """
  Lists species from SWAPI
  """
  def list(conn, _params) do
    results =
      Db.Repo.all(Swapi.Species)
      |> Enum.map(fn struct -> struct |> Map.from_struct() |> Map.delete(:__meta__) end)

    json(conn, %{results: results})
  end
end
