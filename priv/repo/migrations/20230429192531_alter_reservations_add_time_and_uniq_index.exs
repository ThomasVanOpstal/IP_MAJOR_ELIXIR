defmodule IpMajor.Repo.Migrations.AlterReservationsAddTimeAndUniqIndex do
  use Ecto.Migration

  def change do
    alter table(:reservations) do
      add :start_time, :time
      add :end_time, :time
    end
    drop unique_index(:reservations, [:user_id])
    create unique_index(:reservations, [:date, :start_time, :end_time])
  end
end
