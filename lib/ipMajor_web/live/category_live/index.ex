defmodule IpMajorWeb.CategoryLive.Index do
  use IpMajorWeb, :live_view

  alias IpMajor.Contexts.Categorys
  alias IpMajor.Category

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :categorys, list_categorys())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Category")
    |> assign(:category, Categorys.get_category!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Category")
    |> assign(:category, %Category{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Categorys")
    |> assign(:category, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    category = Categorys.get_category!(id)
    {:ok, _} = Categorys.delete_category(category)

    {:noreply, assign(socket, :categorys, list_categorys())}
  end

  defp list_categorys do
    Categorys.list_categorys()
  end
end
