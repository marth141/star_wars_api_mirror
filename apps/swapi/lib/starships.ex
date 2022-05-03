defmodule Swapi.Starships do
  @moduledoc """
  Defines the Ecto-Postgres Schema of SWAPI Starship records
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "swapi_starships" do
    field(:name, :string)
    field(:model, :string)
    field(:starship_class, :string)
    field(:manufacturer, :string)
    field(:cost_in_credits, :string)
    field(:length, :string)
    field(:crew, :string)
    field(:passengers, :string)
    field(:max_atmosphering_speed, :string)
    field(:hyperdrive_rating, :string)
    field(:MGLT, :string)
    field(:cargo_capacity, :string)
    field(:films, {:array, :string})
    field(:pilots, {:array, :string})
    field(:url, :string)
    field(:created, :string)
    field(:edited, :string)
  end

  @doc """
  Validates incoming SWAPI Starship and casts types
  """
  def changeset(module, attrs \\ %{}) do
    module
    |> cast(attrs, [
      :name,
      :model,
      :starship_class,
      :manufacturer,
      :cost_in_credits,
      :length,
      :crew,
      :passengers,
      :max_atmosphering_speed,
      :hyperdrive_rating,
      :MGLT,
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
  Updates a SWAPI Starship record
  """
  def update(module, attrs) do
    module
    |> changeset(attrs)
    |> Db.Repo.update!()
  end

  @doc """
  Creates a SWAPI Starship record
  """
  def create(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Db.Repo.insert!()
  end
end
