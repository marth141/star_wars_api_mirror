defmodule Web.SwapiStarshipsApiController do
  @moduledoc """
  This is the Controller for the "/api/starships" endpoint
  """
  use Web, :controller

  @doc """
  Lists starships from SWAPI
  """
  def list(conn, _params) do
    results =
      Db.Repo.all(Swapi.Starships)
      |> Enum.map(fn struct -> struct |> Map.from_struct() |> Map.delete(:__meta__) end)

    json(conn, %{results: results})
  end
end
