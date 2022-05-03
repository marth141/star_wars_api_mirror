defmodule Swapi.Planets do
  @moduledoc """
  Defines the Ecto-Postgres Schema of SWAPI Planet records
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "swapi_planets" do
    field(:climate, :string)
    field(:created, :string)
    field(:diameter, :string)
    field(:edited, :string)
    field(:films, {:array, :string})
    field(:gravity, :string)
    field(:name, :string)
    field(:orbital_period, :string)
    field(:population, :string)
    field(:residents, {:array, :string})
    field(:rotation_period, :string)
    field(:surface_water, :string)
    field(:terrain, :string)
    field(:url, :string)
  end

  @doc """
  Validates incoming SWAPI Planet and casts types
  """
  def changeset(module, attrs \\ %{}) do
    module
    |> cast(attrs, [
      :climate,
      :created,
      :diameter,
      :edited,
      :films,
      :gravity,
      :name,
      :orbital_period,
      :population,
      :residents,
      :rotation_period,
      :surface_water,
      :terrain,
      :url
    ])
    |> unique_constraint(:url)
  end

  @doc """
  Updates a SWAPI Planet record
  """
  def update(module, attrs) do
    module
    |> changeset(attrs)
    |> Db.Repo.update!()
  end

  @doc """
  Creates a SWAPI Planet record
  """
  def create(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Db.Repo.insert!()
  end
end
