defmodule IpMajor.Repo.Migrations.AlterReservations do
  use Ecto.Migration

  def change do
    alter table(:reservations) do
      add :course_id, references(:courses, on_delete: :delete_all)
      add :payments_id, references(:payments, on_delete: :delete_all)
    end
  end
end
