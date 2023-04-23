defmodule IpMajor.Repo.Migrations.CreateCourseTrainers do
  use Ecto.Migration

  def change do
    create table(:course_trainers) do
      add :course_id, references(:courses, on_delete: :delete_all)
      add :trainer_id, references(:trainers, on_delete: :delete_all)
      timestamps()
    end
  end
end
