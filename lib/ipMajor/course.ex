defmodule IpMajor.Course do
  use Ecto.Schema
  import Ecto.Changeset

  schema "courses" do
    field :name, :string
    field :description, :string
    field :price, :float
    field :duration, :time
    field :max_participants, :integer
    field :min_participants, :integer
    field :status, :string #open, closed, cancelled
    field :comments, :string
    has_many(:reservation, IpMajor.Reservation)
    belongs_to(:location, IpMajor.Location)
    many_to_many(:category, IpMajor.Category, join_through: "category_courses")
    many_to_many(:trainer, IpMajor.Trainer, join_through: "course_trainers")
    timestamps()
  end

  def changeset(course, attrs) do
    course
    |> cast(attrs, [:name, :description, :price, :duration, :start_date, :end_date, :max_participants, :min_participants, :status, :comments, :location_id])
    |> validate_required([:name, :description, :price, :duration, :start_date, :end_date, :max_participants, :min_participants, :status, :comments, :location_id])
    |> unique_constraint(:location_id)
  end
end
