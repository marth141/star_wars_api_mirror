defmodule Web.SwapiPlanetsApiController do
  @moduledoc """
  This is the Controller for the "/api/planets" endpoint
  """
  use Web, :controller
  import Ecto.Query

  @doc """
  Lists planets from SWAPI
  """
  def list(conn, %{"id" => id}) do
    results =
      Db.Repo.all(from(p in Swapi.Planets, where: p.id == ^id))
      |> Enum.map(fn struct -> struct |> Map.from_struct() |> Map.delete(:__meta__) end)

    json(conn, %{results: results})
  end
end
