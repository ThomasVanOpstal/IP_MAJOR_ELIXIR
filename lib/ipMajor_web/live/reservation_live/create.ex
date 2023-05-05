defmodule IpMajorWeb.ReservationLive.Create do
  use IpMajorWeb, :live_view

  alias IpMajor.Contexts.{Courses, Reservations}
  alias IpMajor.{Course, Reservation}

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply,
     apply_action(socket,socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, %{"course_id"=>id}) do
    socket
    |> assign(:page_title, "New Reservation")
    |> assign(:course, Courses.get_course!(String.to_integer(id)))
    |> assign(:reservation, %Reservation{course_id: String.to_integer(id), user_id: 1})
  end
end
