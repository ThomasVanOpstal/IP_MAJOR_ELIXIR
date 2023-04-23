defmodule IpMajor.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string
      add :description, :string
      add :price, :float
      add :duration, :time
      add :max_participants, :integer
      add :min_participants, :integer
      add :comments, :string
      add :status, :string #active, inactive
      timestamps()
    end

  end
end
