defmodule Swapi.Species do
  @moduledoc """
  Defines the Ecto-Postgres Schema of SWAPI Species records
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "swapi_species" do
    field(:name, :string)
    field(:classification, :string)
    field(:designation, :string)
    field(:average_height, :string)
    field(:average_lifespan, :string)
    field(:eye_colors, :string)
    field(:hair_colors, :string)
    field(:skin_colors, :string)
    field(:language, :string)
    field(:homeworld, :string)
    field(:people, {:array, :string})
    field(:films, {:array, :string})
    field(:url, :string)
    field(:created, :string)
    field(:edited, :string)
  end

  @doc """
  Validates incoming SWAPI Species and casts types
  """
  def changeset(module, attrs \\ %{}) do
    module
    |> cast(attrs, [
      :name,
      :classification,
      :designation,
      :average_height,
      :average_lifespan,
      :eye_colors,
      :hair_colors,
      :skin_colors,
      :language,
      :homeworld,
      :people,
      :films,
      :url,
      :created,
      :edited
    ])
    |> unique_constraint(:url)
  end

  @doc """
  Updates a SWAPI Species record
  """
  def update(module, attrs) do
    module
    |> changeset(attrs)
    |> Db.Repo.update!()
  end

  @doc """
  Creates a SWAPI Species record
  """
  def create(attrs) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Db.Repo.insert!()
  end
end
