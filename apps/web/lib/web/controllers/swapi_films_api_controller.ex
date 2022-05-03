defmodule Web.SwapiFilmsApiController do
  @moduledoc """
  This is the Controller for the "/api/films" endpoint
  """
  use Web, :controller

  @doc """
  Lists films from SWAPI
  """
  def list(conn, _params) do
    results =
      Db.Repo.all(Swapi.Films)
      |> Enum.map(fn struct -> struct |> Map.from_struct() |> Map.delete(:__meta__) end)

    json(conn, %{results: results})
  end
end
