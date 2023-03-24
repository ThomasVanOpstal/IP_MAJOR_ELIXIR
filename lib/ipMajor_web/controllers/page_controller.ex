defmodule IpMajorWeb.PageController do
  use IpMajorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
