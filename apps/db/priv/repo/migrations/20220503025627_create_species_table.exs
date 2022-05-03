defmodule Db.Repo.Migrations.CreateSpeciesTable do
  use Ecto.Migration

  def up do
    create table(:swapi_species) do
      add(:name, :string)
      add(:classification, :string)
      add(:designation, :string)
      add(:average_height, :string)
      add(:average_lifespan, :string)
      add(:eye_colors, :string)
      add(:hair_colors, :string)
      add(:skin_colors, :string)
      add(:language, :string)
      add(:homeworld, :string)
      add(:people, {:array, :string})
      add(:films, {:array, :string})
      add(:url, :string)
      add(:created, :string)
      add(:edited, :string)
    end

    create(unique_index(:swapi_species, [:url]))
  end

  def down do
    drop(table(:swapi_species))
  end
end
