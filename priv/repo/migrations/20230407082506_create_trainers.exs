defmodule IpMajor.Repo.Migrations.CreateTrainers do
  use Ecto.Migration

  def change do
    create table(:trainers) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :role, :string #trainer
      add :birthday, :date
      add :comments, :string
      timestamps()
    end
    create unique_index(:trainers, [:email])
  end
end
