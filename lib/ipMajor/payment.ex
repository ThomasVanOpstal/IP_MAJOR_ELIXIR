defmodule IpMajor.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payments" do
    field :amount, :float
    field :payment_date, :date
    field :payment_method, :string
    field :payment_status, :string
    field :payment_type, :string
    field :payment_reference, :string
    field :payment_comments, :string
    belongs_to(:reservation, IpMajor.Reservation)
    timestamps()
  end

  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:amount, :payment_date, :payment_method, :payment_status, :payment_type, :payment_reference, :reservation_id])
    |> validate_required([:amount, :payment_date, :payment_method, :payment_status, :payment_type, :payment_reference, :reservation_id])
  end
end
