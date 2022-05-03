defmodule Db.Repo.Migrations.CreatePlanetsTable do
  use Ecto.Migration

  def up do
    create table(:swapi_planets) do
      add(:climate, :string)
      add(:created, :string)
      add(:diameter, :string)
      add(:edited, :string)
      add(:films, {:array, :string})
      add(:gravity, :string)
      add(:name, :string)
      add(:orbital_period, :string)
      add(:population, :string)
      add(:residents, {:array, :string})
      add(:rotation_period, :string)
      add(:surface_water, :string)
      add(:terrain, :string)
      add(:url, :string)
    end

    create unique_index(:swapi_planets, [:url])
  end

  def down do
    drop table(:swapi_planets)
  end
end
