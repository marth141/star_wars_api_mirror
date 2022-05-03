defmodule Swapi.People do
  @moduledoc """
  Defines the Ecto-Postgres Schema of SWAPI People records
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "swapi_people" do
    field(:birth_year, :string)
    field(:created, :string)
    field(:edited, :string)
    field(:eye_color, :string)
    field(:films, {:array, :string})
    field(:gender, :string)
    field(:hair_color, :string)
    field(:height, :string)
    field(:homeworld, :string)
    field(:mass, :string)
    field(:name, :string)
    field(:skin_color, :string)
    field(:species, {:array, :string})
    field(:starships, {:array, :string})
    field(:url, :string)
    field(:vehicles, {:array, :string})
  end

  @doc """
  Validates incoming SWAPI People and casts types
  """
  def changeset(module, attrs \\ %{}) do
    module
    |> cast(attrs, [
      :birth_year,
      :created,
      :edited,
      :eye_color,
      :films,
      :gender,
      :hair_color,
      :height,
      :homeworld,
      :mass,
      :name,
      :skin_color,
      :species,
      :starships,
      :url,
      :vehicles
    ])
    |> unique_constraint(:url)
  end

  @doc """
  Updates a SWAPI People record
  """
  def update(module, attrs) do
    module
    |> changeset(attrs)
    |> Db.Repo.update!()
  end

  @doc """
  Creates a SWAPI People record
  """
  def create(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Db.Repo.insert!()
  end
end
