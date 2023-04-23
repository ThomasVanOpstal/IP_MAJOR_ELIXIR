defmodule IpMajor.CategoryCourse do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query


  schema "category_courses" do
    belongs_to(:category, IpMajor.Category)
    belongs_to(:course, IpMajor.Course)
    timestamps()
  end

  def changeset(category_course, attrs) do
    category_course
    |> cast(attrs, [:category_id, :course_id])
    |> validate_required([:category_id, :course_id])
    |> unique_constraint([:category_id, :course_id])
  end
end
