defmodule Swapi.Finch do
  def get_planets() do
    Finch.build(:get, "http://localhost:4000/api/planets") |> Finch.request(SwapiFinch)
  end

  def get_planet_by_id() do
    Finch.build(:get, "http://localhost:4000/api/planets?id=1") |> Finch.request(SwapiFinch)
  end
end
