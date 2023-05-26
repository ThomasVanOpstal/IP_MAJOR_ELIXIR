defmodule IpMajorWeb.Auth.Redirect do
  import Plug.Conn
  import Phoenix.Controller
  alias IpMajor.Server

  @behaviour Plug

  def init(_opts), do: []

  def call(conn, _opts) do
    case Server.pop() do
      {:reply, head , tail} ->
        IO.inspect(head)
      _->
        conn
           |> put_flash(:info, "You must be logged in to access this page")
           |> redirect(to: "/login")
      end
    end

    # case Server.lookup(:user, :token) do
    #   [{_, token}] ->
    #     IO.inspect(token)
    #     if token == nil do
    #       conn
    #       |> put_flash(:info, "You must be logged in to access this page")
    #       |> redirect(to: "/login")
    #     else
    #       conn |> assign(:token, token)
    #     end
    #   _ ->
    #     conn
    #     |> put_flash(:info, "You must be logged in to access this page")
    #     |> redirect(to: "/login")
    # end
  #end
  end
