defmodule IpMajorWeb.LoginLive.Index do
    use IpMajorWeb, :live_view

    alias IpMajor.Contexts.{Profiles, UserContext}
    alias IpMajor.{Profile, User}
    alias IpMajor.Repo
    alias IpMajorWeb.Auth.Guardian


    @impl true
    def mount(_param, _session, socket) do
      changeset = %{}
      {:ok,socket
      |> assign(:changeset, changeset )
      |> assign(:user, %User{})
     }
    end

    def update(%{user: user} = assigns, socket) do
      changeset = UserContext.change_user(user)
      {:ok,
       socket
       |> assign(assigns)
       |> assign(:changeset, changeset)}
    end
    def handle_params(params, _url, socket) do
      {:noreply, apply_action(socket, socket.assigns.live_action, params)}
    end

    defp apply_action(socket, :index, _params) do
      socket
      |> assign(:page_title, "Login")
    end

    def handle_event("login", %{"username" => username, "not_hashed_password" => password}, socket) do
      case Guardian.authenticate(username, password)
      do
        {:ok, user, token} ->
          IO.puts("User: #{inspect(user)}")
          {:noreply, login_reply({:ok, user, token}, socket)}
        {:error, reason} ->
          IO.puts("Error: #{inspect(reason)}")
          {:noreply, login_reply({:error, reason}, socket)}
      end
    end
    def handle_event("validate", %{"user" => user_params}, socket )do
      changeset = socket.assigns.user
      |> UserContext.change_user(user_params)
      |> Map.put(:action, :validate)

      {:noreply, assign(socket, :changeset, changeset)}
    end

    defp login_reply({:ok, user, token}, socket) do
      IO.puts(IpMajor.Server.push(token))


      socket
      |> assign(:user, user)
      |> assign(:token, token)
      |> put_flash(:info, "Welcome back!")
      |> push_redirect(to: "/admin/courses/overzicht")
    end

    defp login_reply({:error, reason}, socket) do
      socket
      |> put_flash(:error, to_string(reason))
    end

    defp list_profiles do
      Profiles.list_profiles()
    end





  end
