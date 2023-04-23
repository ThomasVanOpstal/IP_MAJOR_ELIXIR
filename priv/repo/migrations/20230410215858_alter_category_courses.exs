defmodule IpMajor.Repo.Migrations.AlterCategoryCourses do
  use Ecto.Migration

  def change do
    alter table(:category_courses) do
      modify :inserted_at, :utc_datetime, default: fragment("now()")
    end
  end
end
