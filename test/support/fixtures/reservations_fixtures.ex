defmodule IpMajor.ReservationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IpMajor.Reservations` context.
  """

  @doc """
  Generate a reservation.
  """
  def reservation_fixture(attrs \\ %{}) do
    {:ok, reservation} =
      attrs
      |> Enum.into(%{
        comments: "some comments",
        date: ~D[2023-04-12],
        duration: ~T[14:00:00],
        status: "some status"
      })
      |> IpMajor.Reservations.create_reservation()

    reservation
  end
end
