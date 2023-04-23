defmodule IpMajorWeb.TrainerLive.FormComponent do
  use IpMajorWeb, :live_component

  alias IpMajor.Contexts.Trainers
  alias IpMajor.Trainer

  @impl true
  def update(%{trainer: trainer} = assigns, socket) do
    changeset = Trainers.change_trainer(trainer)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"trainer" => trainer_params}, socket) do
    changeset =
      socket.assigns.trainer
      |> Trainers.change_trainer(trainer_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"trainer" => trainer_params}, socket) do
    save_trainer(socket, socket.assigns.action, trainer_params)
  end

  defp save_trainer(socket, :edit, trainer_params) do
    case Trainers.update_trainer(socket.assigns.trainer, trainer_params) do
      {:ok, _trainer} ->
        {:noreply,
         socket
         |> put_flash(:info, "Trainer updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_trainer(socket, :new, trainer_params) do
    case Trainers.create_trainer(trainer_params) do
      {:ok, _trainer} ->
        {:noreply,
         socket
         |> put_flash(:info, "Trainer created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
