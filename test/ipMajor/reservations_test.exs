defmodule IpMajor.ReservationsTest do
  use IpMajor.DataCase

  alias IpMajor.Reservations

  describe "reservations" do
    alias IpMajor.Reservations.Reservation

    import IpMajor.ReservationsFixtures

    @invalid_attrs %{comments: nil, date: nil, duration: nil, status: nil}

    test "list_reservations/0 returns all reservations" do
      reservation = reservation_fixture()
      assert Reservations.list_reservations() == [reservation]
    end

    test "get_reservation!/1 returns the reservation with given id" do
      reservation = reservation_fixture()
      assert Reservations.get_reservation!(reservation.id) == reservation
    end

    test "create_reservation/1 with valid data creates a reservation" do
      valid_attrs = %{comments: "some comments", date: ~D[2023-04-12], duration: ~T[14:00:00], status: "some status"}

      assert {:ok, %Reservation{} = reservation} = Reservations.create_reservation(valid_attrs)
      assert reservation.comments == "some comments"
      assert reservation.date == ~D[2023-04-12]
      assert reservation.duration == ~T[14:00:00]
      assert reservation.status == "some status"
    end

    test "create_reservation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reservations.create_reservation(@invalid_attrs)
    end

    test "update_reservation/2 with valid data updates the reservation" do
      reservation = reservation_fixture()
      update_attrs = %{comments: "some updated comments", date: ~D[2023-04-13], duration: ~T[15:01:01], status: "some updated status"}

      assert {:ok, %Reservation{} = reservation} = Reservations.update_reservation(reservation, update_attrs)
      assert reservation.comments == "some updated comments"
      assert reservation.date == ~D[2023-04-13]
      assert reservation.duration == ~T[15:01:01]
      assert reservation.status == "some updated status"
    end

    test "update_reservation/2 with invalid data returns error changeset" do
      reservation = reservation_fixture()
      assert {:error, %Ecto.Changeset{}} = Reservations.update_reservation(reservation, @invalid_attrs)
      assert reservation == Reservations.get_reservation!(reservation.id)
    end

    test "delete_reservation/1 deletes the reservation" do
      reservation = reservation_fixture()
      assert {:ok, %Reservation{}} = Reservations.delete_reservation(reservation)
      assert_raise Ecto.NoResultsError, fn -> Reservations.get_reservation!(reservation.id) end
    end

    test "change_reservation/1 returns a reservation changeset" do
      reservation = reservation_fixture()
      assert %Ecto.Changeset{} = Reservations.change_reservation(reservation)
    end
  end
end
