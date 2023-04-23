defmodule IpMajor.LocationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IpMajor.Locations` context.
  """

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        city: "some city",
        comments: "some comments",
        country: "some country",
        description: "some description",
        latitude: 120.5,
        longitude: 120.5,
        postal_code: "some postal_code",
        street: "some street",
        zip: "some zip"
      })
      |> IpMajor.Locations.create_location()

    location
  end
end
