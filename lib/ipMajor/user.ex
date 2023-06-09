defmodule IpMajor.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Pbkdf2

  @topic inspect(__MODULE__)


  schema "users" do
    field :username, :string
    field :password, :string, redact: true
    field :password_confirmation, :string, virtual: true
    field :remember_me, :boolean, virtual: true, default: false
    has_many(:profile, IpMajor.Profile)
    has_many(:reservation, IpMajor.Reservation)
    timestamps()
  end

  #schema "users" do
    #field :username, :string
    #field :password, :string

    #timestamps()
  #end

  @doc false
  def changeset(user, attrs) do
     user
     |> cast(attrs, [:username, :password])
     |> validate_required([:username, :password])
     |> unique_constraint(:username)
     |> validate_length(:password, min: 8, max: 16)
   end


  def registration_changeset(user, params) do
    fields = ~w(username password)a
    user
    |> cast(params, fields)
    |> validate_required(fields)
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 8, max: 16)
    |> unique_constraint(:username)
    |> put_hash
  end


  defp put_hash(%Ecto.Changeset{valid?: false} = changeset), do: changeset
  defp put_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hash_pwd_salt(password))
  end



  # def changeset(user, attrs) do
  #   user
  #   |> cast(attrs, [:username, :not_hashed_password])
  #   |> validate_required([:username, :not_hashed_password])
  #   |> unique_constraint(:username)
  #   |> put_password_hash()
  # end



  # defp put_password_hash(
  #        %Ecto.Changeset{valid?: true, changes: %{not_hashed_password: not_hashed_password}} = changeset
  #      ) do
  #   change(changeset, password: hash_pwd_salt(not_hashed_password))
  # end
  # defp put_password_hash(changeset), do: changeset



end
