defmodule Web.SwapiPeopleApiController do
  @moduledoc """
  This is the Controller for the "/api/people" endpoint
  """
  use Web, :controller

  @doc """
  Lists people from SWAPI
  """
  def list(conn, _params) do
    results =
      Db.Repo.all(Swapi.People)
      |> Enum.map(fn struct -> struct |> Map.from_struct() |> Map.delete(:__meta__) end)

    json(conn, %{results: results})
  end
end
