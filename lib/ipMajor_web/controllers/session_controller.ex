defmodule IpMajorWeb.SessionController do
  use IpMajorWeb, :controller
  alias IpMajor.Contexts.{Profiles, UserContext}
  alias IpMajor.{Profile, User}
  alias IpMajor.Repo
  alias IpMajorWeb.Auth.Guardian

  def new(conn, _) do
    changeset = UserContext.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)

    if maybe_user do
      redirect(conn, to: Routes.course_index_path(conn, IpMajorWeb.ReservationLive.Index, :new))
    else
      render(conn, "new.html", changeset: changeset, action: Routes.session_path(conn, :login))
    end
  end
  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    UserContext.authenticate_user(username, password)
    |> login_reply(conn)
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: "/login")
  end

  defp login_reply({:ok, user, token}, conn) do
    conn
    |> put_flash(:info, "Welcome back!")
    |> Guardian.Plug.sign_in(user)
  end

  defp login_reply({:error, reason}, conn) do
    conn
    |> put_flash(:error, to_string(reason))
    |> new(%{})
  end
end
