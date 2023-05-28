defmodule IpMajorWeb.ReservationLive.FormComponent do
  use IpMajorWeb, :live_component

  alias IpMajor.Contexts.Reservations
  alias IpMajor.Reservation

  @impl true
  def update(%{reservation: reservation} = assigns, socket) do

    changeset = Reservations.change_reservation(reservation)
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"reservation" => reservation_params}, socket) do
    changeset =
      socket.assigns.reservation
      |> Reservations.change_reservation(reservation_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"reservation" => reservation_params}, socket) do
    save_reservation(socket, socket.assigns.action, reservation_params)
  end

  defp save_reservation(socket, :edit, reservation_params) do
    case Reservations.update_reservation(socket.assigns.reservation, reservation_params) do
      {:ok, _reservation} ->
        {:noreply,
         socket
         |> put_flash(:info, "Reservation updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_reservation(socket, :new, reservation_params) do
    case Reservations.create_reservation(socket.assigns.reservation, reservation_params) do
      {:ok, reservation} ->
        IO.inspect(reservation)
        {:noreply,
         socket
         |> put_flash(:info, "Reservation created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect("error")
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
