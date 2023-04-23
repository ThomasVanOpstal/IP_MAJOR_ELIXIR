defmodule IpMajor.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :street, :string
      add :city, :string
      add :country, :string
      add :zip, :string
      add :postal_code, :string
      add :comments, :string
      add :latitude , :float
      add :longitude, :float
      add :description, :string
      timestamps()
    end
    create unique_index(:locations, [:latitude, :longitude])

  end
end
