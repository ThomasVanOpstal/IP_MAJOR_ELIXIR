defmodule IpMajorWeb.RegisterLive.Index do
    use IpMajorWeb, :live_view
    alias IpMajor.Contexts.{Profiles, UserContext}
    alias IpMajor.{Profile, User, Course}
    @impl true
    def mount(_params, _session, socket) do
        {:ok, socket
        |>assign(:changeset, %{})
        |>assign(:user, %User{})}
    end

    def handle_event("register", %{"username" => username, "password" => password}, socket) do
      case create_user(%{username: username, password: password}) do
        {:ok, user} ->

          {:noreply, socket
          |> assign(:user, user)
          |> push_redirect(to: Routes.course_overzicht_path(socket, :overzicht, Course))}
        {:error, changeset} ->
          IO.puts("Error: #{inspect(changeset)}")
          {:noreply, socket
          |> put_flash(:error, "Error: #{inspect(changeset)}" )
          |> assign(:changeset, changeset)
        }
      end
      {:noreply, socket}
    end

    defp create_user(changeset) do
      case UserContext.create_user(changeset) do
        {:ok, user} ->
          {:ok, user}
        {:error, changeset} ->
          {:error, changeset}
      end
    end

end
