defmodule IpMajorWeb.UserLive.Index do
  use IpMajorWeb, :live_view
  alias IpMajor.Contexts.{ProfileContext, UserContext}
  alias IpMajor.{Profile, User}
  alias IpMajor.Repo



  def mount(_params, _session, socket) do
    if connected?(socket) do UserContext.subscribe end
    {:ok, assign(socket, :users, UserContext.list_users())}
  end


  def render(assigns) do
    ~L"""
    <h1>Listing Users</h1>

    <table>
        <thead>
            <tr>
                <th>username</th>
                <th>password</th>

                <th></th>
            </tr>
        </thead>
        <tbody>
            <%= for user <- @users do %>
            <tr>
                <td><%= user.username %></td>
                <td><%= user.password %></td>

            </tr>
            <% end %>
        </tbody>
    </table>
    """

  end

  def handle_event("delete_user", %{"id" => id}, socket) do
    user = UserContext.get_user!(id)
    {:ok, _user} = UserContext.delete_user(user)
    {:noreply, socket}
  end

  def handle_info({UserContext, [:index, _], _}, socket) do
    {:noreply, assign(socket, :users, UserContext.list_users())}
  end
end
