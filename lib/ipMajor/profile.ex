defmodule IpMajor.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :role, Ecto.Enum, values: [:admin, :user]
    field :birthday, :date
    field :comments, :string

    belongs_to(:user, IpMajor.User)
    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:firstname, :lastname, :email, :role, :birthday, :comments, :user_id])
    |> validate_required([:firstname, :lastname, :email, :birthday, :comments, :user_id])
    |> unique_constraint([:email, :user_id])
    |> validate_change(:birthday, &older_than_18/2)
    |> validate_format(:email, ~r/@/)
  end

  def add_user(profile, user) do
    profile
    |> cast(%{}, [:user_id])
    |> put_assoc(:user, user)
  end

  def older_than_18(:birthday, birthday) do
    {year, month, day} = Date.to_erl(Date.utc_today())
    min_date = Date.from_erl!({year - 18, month, day})
    case Date.compare(min_date, birthday) do
      :lt -> [birth_date: "ouder dan 18 jaar"]
      _ -> []
    end
  end
end
