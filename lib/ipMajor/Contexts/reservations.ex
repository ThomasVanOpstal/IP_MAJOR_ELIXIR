defmodule IpMajor.Contexts.Reservations do
  @moduledoc """
  The Reservations context.
  """

  import Ecto.Query, warn: false
  alias IpMajor.Repo

  alias IpMajor.Reservation


  @doc """
  Returns the list of reservations.

  ## Examples

      iex> list_reservations()
      [%Reservation{}, ...]

  """
  def list_reservations do
    Repo.all(Reservation)
  end

  @doc """
  Gets a single reservation.

  Raises if the Reservation does not exist.

  ## Examples

      iex> get_reservation!(123)
      %Reservation{}

  """
  def get_reservation(id) do
    Repo.get!(Reservation, id)

  end

  @doc """
  Creates a reservation.

  ## Examples

      iex> create_reservation(%{field: value})
      {:ok, %Reservation{}}

      iex> create_reservation(%{field: bad_value})
      {:error, ...}

  """
  def create_reservation(%Reservation{} = reservation, attrs \\ %{}) do
    reservation
    |> Reservation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reservation.

  ## Examples

      iex> update_reservation(reservation, %{field: new_value})
      {:ok, %Reservation{}}

      iex> update_reservation(reservation, %{field: bad_value})
      {:error, ...}

  """
  def update_reservation(%Reservation{} = reservation, attrs) do
    reservation
    |> Reservation.changeset(attrs)
    |> IO.inspect()
    |> Repo.update()
  end

  @doc """
  Deletes a Reservation.

  ## Examples

      iex> delete_reservation(reservation)
      {:ok, %Reservation{}}

      iex> delete_reservation(reservation)
      {:error, ...}

  """
  def delete_reservation(%Reservation{} = reservation) do
    Repo.delete(reservation)
  end


  @doc """
  Returns a data structure for tracking reservation changes.

  ## Examples

      iex> change_reservation(reservation)
      %Todo{...}

  """
  def change_reservation(%Reservation{} = reservation, _attrs \\ %{}) do
    reservation
    |> Reservation.changeset(%{})
  end
end
