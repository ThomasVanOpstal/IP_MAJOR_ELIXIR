defmodule IpMajorWeb.CourseLive.TableComponent do
  use IpMajorWeb, :live_component
  alias IpMajor.Contexts.Courses
  alias IpMajor.Course

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    {:ok, socket
    |> assign(assigns)
    |> assign(:course, Courses.get_course!(assigns.idCourse))}

  end
  def render(assigns) do
    ~H"""
    <div class="items-center p-8 w-full">
      <table class ="w-full" id="hero">
        <thead class="text-xs uppercase dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="px-6 py-3">Description</th>
            <th scope="col" class="px-6 py-3">Price</th>
            <th scope="col" class="px-6 py-3">Duration</th>
            <th></th>
        </tr>
        </thead>
        <tbody >
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700"}>
            <td class="px-6 py-4"><%= @course.description %></td>
            <td class="px-6 py-4"><%= @course.price %></td>
            <td class="px-6 py-4"><%= @course.duration %></td>
            <td><%= live_patch "Make a reservation", to: Routes.reservation_create_path(@socket, :new, course_id: @course.id ) %></td>
            </tr>
        </tbody>
      </table>
    </div>
    """
  end

end
