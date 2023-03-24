defmodule IpMajor.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :username, :string
    field :password, :string, redact: true
    has_many(:profile, IpMajor.Profile)
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username, :password])
    |> unique_constraint(:username)
  end


end
