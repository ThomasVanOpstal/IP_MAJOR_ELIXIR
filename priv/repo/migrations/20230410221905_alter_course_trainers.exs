defmodule IpMajor.Repo.Migrations.AlterCourseTrainers do
  use Ecto.Migration

  def change do
    alter table(:course_trainers) do
      modify :updated_at, :utc_datetime, default: fragment("now()")
      modify :inserted_at, :utc_datetime, default: fragment("now()")
    end
  end
end
