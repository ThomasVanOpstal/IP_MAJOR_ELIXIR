defmodule IpMajorWeb.RegisterLive.Index do
    use IpMajorWeb, :live_view
    @impl true
    def mount(_param, _session, socket) do
        {:ok, socket}
    end

  #   @impl true
  # def mount(_params, _session, socket) do
  #   {:ok, assign(socket, changeset: %User{} |> User.changeset())}
  # end

  # def handle_event("register", %{"username" => username, "password" => password}, socket) do
  #   changeset = UserContext.change_user(%UserContext.User{}, %{username: username, password: password})
  #   {:noreply, %{socket | changeset: changeset}}
  # end
  
end