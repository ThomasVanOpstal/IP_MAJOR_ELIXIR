defmodule IpMajorWeb.ProfileLive.FormComponent do
  use IpMajorWeb, :live_component

  alias IpMajor.Profiles

  @impl true
  def update(%{profile: profile} = assigns, socket) do
    changeset = Profiles.change_profile(profile)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"profile" => profile_params}, socket) do
    changeset =
      socket.assigns.profile
      |> Profiles.change_profile(profile_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"profile" => profile_params}, socket) do
    save_profile(socket, socket.assigns.action, profile_params)
  end

  defp save_profile(socket, :edit, profile_params) do
    case Profiles.update_profile(socket.assigns.profile, profile_params) do
      {:ok, _profile} ->
        {:noreply,
         socket
         |> put_flash(:info, "Profile updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_profile(socket, :new, profile_params) do
    case Profiles.create_profile(profile_params) do
      {:ok, _profile} ->
        {:noreply,
         socket
         |> put_flash(:info, "Profile created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
