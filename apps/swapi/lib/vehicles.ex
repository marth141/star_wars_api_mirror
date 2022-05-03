defmodule Swapi.Vehicles do
  @moduledoc """
  Defines the Ecto-Postgres Schema of SWAPI Vehicles records
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "swapi_vehicles" do
    field(:name, :string)
    field(:model, :string)
    field(:vehicle_class, :string)
    field(:manufacturer, :string)
    field(:length, :string)
    field(:cost_in_credits, :string)
    field(:crew, :string)
    field(:passengers, :string)
    field(:max_atmosphering_speed, :string)
    field(:cargo_capacity, :string)
    field(:films, {:array, :string})
    field(:pilots, {:array, :string})
    field(:url, :string)
    field(:created, :string)
    field(:edited, :string)
  end

  @doc """
  Validates incoming SWAPI Vehicles and casts types
  """
  def changeset(module, attrs \\ %{}) do
    module
    |> cast(attrs, [
      :name,
      :model,
      :vehicle_class,
      :manufacturer,
      :length,
      :cost_in_credits,
      :crew,
      :passengers,
      :max_atmosphering_speed,
      :cargo_capacity,
      :films,
      :pilots,
      :url,
      :created,
      :edited
    ])
    |> unique_constraint(:url)
  end

  @doc """
  Updates a SWAPI Vehicles record
  """
  def update(module, attrs) do
    module
    |> changeset(attrs)
    |> Db.Repo.update!()
  end

  @doc """
  Creates a SWAPI Vehicles record
  """
  def create(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Db.Repo.insert!()
  end
end
