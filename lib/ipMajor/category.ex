defmodule IpMajor.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categorys" do
    field :name, :string
    field :description, :string
    many_to_many :course, IpMajor.Course, join_through: "category_courses"
    timestamps()
  end

end
