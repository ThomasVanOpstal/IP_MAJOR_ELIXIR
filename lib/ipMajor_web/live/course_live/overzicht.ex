defmodule IpMajorWeb.CourseLive.Overzicht do
  use IpMajorWeb, :live_view

  alias IpMajor.Contexts.Courses
  alias IpMajor.Course
  alias IpMajorWeb.CourseLive.TableComponent

  @impl true
  def mount(_params, _session, socket) do
    socket = socket
    |> assign(:showTable, false)
    {:ok, socket}
  end

  def handle_event("showTable",%{"id" => id}, socket) do
    require IEx; IEx.pry()

    socket = socket
    |> assign(:idCourse, String.to_integer(id))
    |> assign(:showTable, true)
    {:noreply, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end
  defp apply_action(socket, :redirect, _params) do
    {:noreply, push_patch(socket, to: Routes.reservation_create_path(socket, :create))}
  end

  defp list_courses do
    Courses.list_courses()
  end
  defp apply_action(socket, :overzicht, _params) do
    socket
    |> assign(:page_title, page_title(:getCourse))
    |> assign(:courses, list_courses())
  end
  defp page_title(:getCourse), do: "Course Features"
  defp page_title(:overzicht), do: "Overview Course"


end
