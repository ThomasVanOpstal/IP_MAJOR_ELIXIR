defmodule IpMajorWeb.Auth.Redirect do
  import Plug.Conn
  import Phoenix.Controller
  alias IpMajor.Server

  @behaviour Plug

  def init(_opts), do: []

  def call(conn, _opts) do
    token = Server.pop()
    if token != nil do
      conn = put_session(conn, :token, token)
    else if get_session(conn, :token) != nil do
      conn
    else if token == nil do
      conn
      |> put_flash(:info, "You must be logged in to access this page")
      |> redirect(to: "/")
    end
    end
  end
end
end
