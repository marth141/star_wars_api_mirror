defmodule Db.Repo.Migrations.CreatePeopleTable do
  use Ecto.Migration

  def up do
    create table(:swapi_people) do
      add(:birth_year, :string)
      add(:created, :string)
      add(:edited, :string)
      add(:eye_color, :string)
      add(:films, {:array, :string})
      add(:gender, :string)
      add(:hair_color, :string)
      add(:height, :string)
      add(:homeworld, :string)
      add(:mass, :string)
      add(:name, :string)
      add(:skin_color, :string)
      add(:species, {:array, :string})
      add(:starships, {:array, :string})
      add(:url, :string)
      add(:vehicles, {:array, :string})
    end

    create unique_index(:swapi_people, [:url])
  end

  def down do
    drop table(:swapi_people)
  end
end
