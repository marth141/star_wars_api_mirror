defmodule Db.Repo.Migrations.CreateFilmsTable do
  use Ecto.Migration

  def up do
    create table(:swapi_films) do
      add(:title, :string)
      add(:episode_id, :integer)
      add(:opening_crawl, :text)
      add(:director, :string)
      add(:producer, :string)
      add(:release_date, :date)
      add(:species, {:array, :text})
      add(:starships, {:array, :string})
      add(:vehicles, {:array, :string})
      add(:characters, {:array, :string})
      add(:planets, {:array, :string})
      add(:url, :string)
      add(:created, :string)
      add(:edited, :string)
    end

    create(unique_index(:swapi_films, [:url]))
  end

  def down do
    drop(table(:swapi_films))
  end
end
