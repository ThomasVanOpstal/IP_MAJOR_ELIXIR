defmodule IpMajor.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :birthday, :date
      add :comments, :string
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
    create unique_index(:profiles, [:email])
  end
end
