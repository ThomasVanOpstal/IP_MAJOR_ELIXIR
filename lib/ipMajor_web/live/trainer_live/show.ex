defmodule IpMajorWeb.TrainerLive.Show do
  use IpMajorWeb, :live_view

  alias IpMajor.Contexts.Trainers
  alias IpMajor.Trainer

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:trainer, Trainers.get_trainer!(id))}
  end

  defp page_title(:show), do: "Show Trainer"
  defp page_title(:edit), do: "Edit Trainer"
end
