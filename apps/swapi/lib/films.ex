defmodule Swapi.Films do
  @moduledoc """
  Defines the Ecto-Postgres Schema of SWAPI Species records
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "swapi_films" do
    field(:title, :string)
    field(:episode_id, :integer)
    field(:opening_crawl, :string)
    field(:director, :string)
    field(:producer, :string)
    field(:release_date, :date)
    field(:species, {:array, :string})
    field(:starships, {:array, :string})
    field(:vehicles, {:array, :string})
    field(:characters, {:array, :string})
    field(:planets, {:array, :string})
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
      :title,
      :episode_id,
      :opening_crawl,
      :director,
      :producer,
      :release_date,
      :species,
      :starships,
      :vehicles,
      :characters,
      :planets,
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
