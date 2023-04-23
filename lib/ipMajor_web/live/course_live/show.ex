defmodule IpMajorWeb.CourseLive.Show do
  use IpMajorWeb, :live_view

  alias IpMajor.Contexts.Courses
  alias IpMajor.Course

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:course, Courses.get_course!(id))}
  end

  defp page_title(:show), do: "Show Course"
  defp page_title(:edit), do: "Edit Course"
end
