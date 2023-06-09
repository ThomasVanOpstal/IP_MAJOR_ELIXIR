defmodule IpMajor.Repo.Migrations.CreateCategorys do
  use Ecto.Migration

  def change do
    create table(:categorys) do
      add :name, :string
      add :description, :string
      timestamps()
    end
    create unique_index(:categorys, [:name])

  end
end
