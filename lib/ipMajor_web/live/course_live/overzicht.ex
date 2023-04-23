defmodule IpMajorWeb.CourseLive.Overzicht do
  use IpMajorWeb, :live_view

  alias IpMajor.Contexts.Courses
  alias IpMajor.Course

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :courses, list_courses())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end
  defp apply_action(socket, :redirect, _params) do
    {:noreply, push_patch(socket, to: Routes.reservation_create_path(@conn, :create))}

  end
  defp list_courses do
    Courses.list_courses()
  end

  defp apply_action(socket, :overzicht, _params) do
    socket
    |> assign(:page_title, "Listing Courses")
    |> assign(:course, nil)
  end

end
