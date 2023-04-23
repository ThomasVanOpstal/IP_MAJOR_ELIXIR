defmodule IpMajorWeb.TrainerLive.Index do
  use IpMajorWeb, :live_view

  alias IpMajor.Contexts.Trainers
  alias IpMajor.Trainer

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :trainers, list_trainers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Trainer")
    |> assign(:trainer, Trainers.get_trainer!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Trainer")
    |> assign(:trainer, %Trainer{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Trainers")
    |> assign(:trainer, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    trainer = Trainers.get_trainer!(id)
    {:ok, _} = Trainers.delete_trainer(trainer)

    {:noreply, assign(socket, :trainers, list_trainers())}
  end

  defp list_trainers do
    Trainers.list_trainers()
  end
end
