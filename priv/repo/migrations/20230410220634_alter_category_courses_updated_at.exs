defmodule IpMajor.Repo.Migrations.AlterCategoryCoursesUpdatedAt do
  use Ecto.Migration

  def change do
    alter table(:category_courses) do
      modify :updated_at, :utc_datetime, default: fragment("now()")
    end
  end
end
