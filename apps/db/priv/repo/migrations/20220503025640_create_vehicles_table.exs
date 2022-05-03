defmodule Db.Repo.Migrations.CreateVehiclesTable do
  use Ecto.Migration

  def up do
    create table(:swapi_vehicles) do
      add(:name, :string)
      add(:model, :string)
      add(:vehicle_class, :string)
      add(:manufacturer, :string)
      add(:length, :string)
      add(:cost_in_credits, :string)
      add(:crew, :string)
      add(:passengers, :string)
      add(:max_atmosphering_speed, :string)
      add(:cargo_capacity, :string)
      add(:films, {:array, :string})
      add(:pilots, {:array, :string})
      add(:url, :string)
      add(:created, :string)
      add(:edited, :string)
    end

    create(unique_index(:swapi_vehicles, [:url]))
  end

  def down do
    drop(table(:swapi_vehicles))
  end
end
