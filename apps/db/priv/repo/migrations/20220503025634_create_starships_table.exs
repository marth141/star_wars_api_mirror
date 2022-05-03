defmodule Db.Repo.Migrations.CreateStarshipsTable do
  use Ecto.Migration

  def up do
    create table(:swapi_starships) do
      add(:name, :string)
      add(:model, :string)
      add(:starship_class, :string)
      add(:manufacturer, :string)
      add(:cost_in_credits, :string)
      add(:length, :string)
      add(:crew, :string)
      add(:passengers, :string)
      add(:max_atmosphering_speed, :string)
      add(:hyperdrive_rating, :string)
      add(:MGLT, :string)
      add(:cargo_capacity, :string)
      add(:films, {:array, :string})
      add(:pilots, {:array, :string})
      add(:url, :string)
      add(:created, :string)
      add(:edited, :string)
    end

    create(unique_index(:swapi_starships, [:url]))
  end

  def down do
    drop(table(:swapi_starships))
  end
end
