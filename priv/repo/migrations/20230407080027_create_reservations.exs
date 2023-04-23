defmodule IpMajor.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :date, :date
      add :user_id, references(:users, on_delete: :delete_all)
      add :status, :string #pending, confirmed, cancelled
      add :comments, :string
      add :duration, :time
      timestamps()
    end
    create unique_index(:reservations, [:user_id])

  end
end
