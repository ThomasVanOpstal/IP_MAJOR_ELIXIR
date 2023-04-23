defmodule IpMajor.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :street, :string
    field :city, :string
    field :country, :string
    field :zip, :string
    field :postal_code, :string
    field :comments, :string
    field :latitude , :float
    field :longitude, :float
    field :description, :string
    has_many(:courses, IpMajor.Course)
    timestamps()
  end

end
