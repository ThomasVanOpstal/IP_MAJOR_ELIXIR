defmodule IpMajorWeb.ProfileController do
  use IpMajorWeb, :controller

  alias IpMajor.Contexts.{ProfileContext, UserContext}
  alias IpMajor.Profile
  alias IpMajor.Repo

  def new(conn, _params) do
    changeset = ProfileContext.change_profile(%Profile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"profile" => profile_params}) do
    user_id = check_userId(conn)
    user = UserContext.get_user!(user_id)
    case ProfileContext.create_profile(profile_params, user) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile created successfully.")
        |> redirect(to: Routes.profile_path(conn, :show, profile.id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def index(conn, _params) do
    profiles = ProfileContext.list_profiles()
    render(conn, "index.html", profiles: profiles)
  end

  def show(conn, %{"id" => id}) do
    profile = Repo.get!(Profile, id)
    render(conn, "show.html", profile: profile)
  end

  def edit(conn,%{"id" => id}) do
    profile = ProfileContext.get_profile!(id)
    changeset = ProfileContext.change_profile(profile)
    render(conn, "edit.html", profile: profile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "profile" => profile_params}) do
    profile = ProfileContext.get_profile!(id)
    case ProfileContext.update_profile(profile, profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile updated successfully.")
        |> redirect(to: Routes.profile_path(conn, :show, profile.id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", profile: profile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile = ProfileContext.get_profile!(id)
    {:ok, _profile} = ProfileContext.delete_profile(profile)
    conn
    |> put_flash(:info, "Profile deleted successfully.")
    |> redirect(to: Routes.profile_path(conn, :index))
  end

  def check_userId(conn) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> put_flash(:error, "You must be logged in to make a profile.")
        |> redirect(to: Routes.profile_path(conn, :new))
      _ ->
        conn
    end
  end
end
