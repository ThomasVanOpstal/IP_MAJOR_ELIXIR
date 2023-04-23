defmodule IpMajorWeb.UserLive.Show do
  import Ecto.Query
  use IpMajorWeb, :live_view
  alias IpMajor.Contexts.{ProfileContext, UserContext}
  alias IpMajor.{Profile, User}

  def mount(%{"id" => id}, _session, socket) do
    if(connected?(socket)) do UserContext.subscribe end
    user = UserContext.get_user!(id)
    {:ok, assign(socket, :user, user)}
  end

  def render(assigns) do
    ~L"""
    <h1>Showing User</h1>
    <table>
      <thead>
        <tr>
          <th>username</th>
          <th>password</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><%= @user.username %></td>
          <td><%= @user.password %></td>
        </tr>
      </tbody>
    </table>
    """
  end
  def handle_info({UserContext, [:show, _], _}, socket) do
    {:noreply, assign(socket, :user, UserContext.get_user!(@user.id))}
  end


end
