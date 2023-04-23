defmodule IpMajor.Repo.Migrations.AlterCourses do
  use Ecto.Migration

  def change do
    alter table(:courses) do
      add :location_id, references(:locations, on_delete: :delete_all)
    end
    create unique_index(:courses, [:name])

  end
end
