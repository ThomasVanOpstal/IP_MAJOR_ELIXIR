defmodule IpMajor.Contexts.UserContext do
  alias Hex.API.Auth
  alias IpMajor.User
  alias IpMajor.Repo
  import Ecto.Query, warn: false
  alias IpMajorWeb.Auth.Guardian

  @topic inspect(__MODULE__)

  def change_user(%User{} = user) do
    user
    |> User.changeset(%{})
  end
  def subscribe do
    Phoenix.PubSub.subscribe(IpMajor.PubSub, @topic)
  end
  def subscribe(user_id)do
    Phoenix.PubSub.subscribe(IpMajor.PubSub, @topic <> "#{user_id}")
  end



  # def create_user(attr) do
  #   %User{}
  #   |> User.changeset(attr)
  #   |> Repo.insert()
  #   |> notify_subscribers([:user, :created])
  # end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def get_user_by_username(username) do
    User
    |> where(username: ^username)
    |> Repo.one()

  end


  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)
  def get_user(id), do: Repo.get(User, id)
  def get_user_by_email(email) do
    User
    |> where(email: ^email)
    |> Repo.one()
  end

  def authenticate_user(username, password) do
    Guardian.authenticate(username, password)
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.registration_changeset(attrs)
    |> Repo.update()
    |> notify_subscribers([:user, :updated])

  end
  def delete_user(%User{} = user) do
    Repo.delete(user)
    |> notify_subscribers([:user, :deleted])
  end

  defp notify_subscribers({:error, reason}) do {:error, reason} end
  defp notify_subscribers({:ok, result}, event) do
    Phoenix.PubSub.broadcast(IpMajor.PubSub, @topic, {__MODULE__, event, result})

  end





end
