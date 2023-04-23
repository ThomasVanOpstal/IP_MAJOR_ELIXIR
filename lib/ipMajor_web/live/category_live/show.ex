defmodule IpMajorWeb.CategoryLive.Show do
  use IpMajorWeb, :live_view

  alias IpMajor.Contexts.Categorys
  alias IpMajor.Category

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:category, Categorys.get_category!(id))}
  end

  defp page_title(:show), do: "Show Category"
  defp page_title(:edit), do: "Edit Category"
end
