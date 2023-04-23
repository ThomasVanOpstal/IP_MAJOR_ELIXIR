defmodule IpMajor.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Pbkdf2

  @topic inspect(__MODULE__)


  schema "users" do
    field :username, :string
    field :not_hashed_password, :string, virtual: true
    field :password, :string, redact: true
    has_many(:profile, IpMajor.Profile)
    has_many(:reservation, IpMajor.Reservation)
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :not_hashed_password])
    |> validate_required([:username, :not_hashed_password])
    |> unique_constraint(:username)
    |> put_password_hash()
  end



  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{not_hashed_password: not_hashed_password}} = changeset
       ) do
    change(changeset, password: hash_pwd_salt(not_hashed_password))
  end
  defp put_password_hash(changeset), do: changeset



end
