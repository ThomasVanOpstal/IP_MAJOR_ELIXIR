defmodule IpMajorWeb.PageController do
  use IpMajorWeb, :controller
  alias IpMajor.Contexts.{ProfileContext, UserContext, Courses}

  def index(conn, _params) do
    courses = Courses.list_courses()
    render(conn, "index.html", courses: courses)
  end
end
