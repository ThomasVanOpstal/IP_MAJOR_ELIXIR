defmodule IpMajor.Repo.Migrations.CreateCategoryCourses do
  use Ecto.Migration

  def change do
    create table(:category_courses) do
      add :category_id, references(:categorys, on_delete: :delete_all)
      add :course_id, references(:courses, on_delete: :delete_all)
      timestamps()
    end
  end
end
