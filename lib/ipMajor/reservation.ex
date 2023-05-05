defmodule IpMajor.Reservation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reservations" do
    field :date, :date
    field :status, :string #pending, confirmed, cancelled
    field :comments, :string
    field :duration, :time
    field :start_time, :time
    field :end_time, :time
    belongs_to(:user, IpMajor.User)
    belongs_to(:course, IpMajor.Course)
    has_one(:payment, IpMajor.Payment)
    timestamps()
  end

  def changeset(reservation, attrs) do
    reservation
    |> cast(attrs, [:date, :duration, :status,:course_id, :start_time, :end_time, :comments, :user_id])
    |> cast_assoc(:payment)
    |> validate_required([:date, :duration, :status, :user_id, :course_id])
  end
end
