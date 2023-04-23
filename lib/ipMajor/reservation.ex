defmodule IpMajor.Reservation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reservations" do
    field :date, :date
    field :status, :string #pending, confirmed, cancelled
    field :comments, :string
    field :duration, :time
    belongs_to(:user, IpMajor.User)
    belongs_to(:course, IpMajor.Course)
    has_one(:payment, IpMajor.Payment)
    timestamps()
  end

  def changeset(reservation, attrs) do
    reservation
    |> cast(attrs, [:date, :duration, :status,:course_id])
    |> cast_assoc(:payment)
    |> validate_required([:date, :duration, :status, :user_id, :course_id])
    |> unique_constraint([:date, :duration, :user_id, :course_id])
  end
end
