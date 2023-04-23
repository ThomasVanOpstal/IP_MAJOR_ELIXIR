defmodule IpMajor.CourseTrainer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "course_trainers" do
    belongs_to(:course, IpMajor.Course)
    belongs_to(:trainer, IpMajor.Trainer)
    timestamps()
  end

  def changeset(course_trainer, attrs) do
    course_trainer
    |> cast(attrs, [:course_id, :trainer_id])
    |> validate_required([:course_id, :trainer_id])
    |> unique_constraint([:course_id, :trainer_id])
  end
end
