defmodule IpMajor.LocationsTest do
  use IpMajor.DataCase

  alias IpMajor.Locations

  describe "locations" do
    alias IpMajor.Locations.Location

    import IpMajor.LocationsFixtures

    @invalid_attrs %{city: nil, comments: nil, country: nil, description: nil, latitude: nil, longitude: nil, postal_code: nil, street: nil, zip: nil}

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Locations.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Locations.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      valid_attrs = %{city: "some city", comments: "some comments", country: "some country", description: "some description", latitude: 120.5, longitude: 120.5, postal_code: "some postal_code", street: "some street", zip: "some zip"}

      assert {:ok, %Location{} = location} = Locations.create_location(valid_attrs)
      assert location.city == "some city"
      assert location.comments == "some comments"
      assert location.country == "some country"
      assert location.description == "some description"
      assert location.latitude == 120.5
      assert location.longitude == 120.5
      assert location.postal_code == "some postal_code"
      assert location.street == "some street"
      assert location.zip == "some zip"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locations.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      update_attrs = %{city: "some updated city", comments: "some updated comments", country: "some updated country", description: "some updated description", latitude: 456.7, longitude: 456.7, postal_code: "some updated postal_code", street: "some updated street", zip: "some updated zip"}

      assert {:ok, %Location{} = location} = Locations.update_location(location, update_attrs)
      assert location.city == "some updated city"
      assert location.comments == "some updated comments"
      assert location.country == "some updated country"
      assert location.description == "some updated description"
      assert location.latitude == 456.7
      assert location.longitude == 456.7
      assert location.postal_code == "some updated postal_code"
      assert location.street == "some updated street"
      assert location.zip == "some updated zip"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Locations.update_location(location, @invalid_attrs)
      assert location == Locations.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Locations.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Locations.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Locations.change_location(location)
    end
  end
end
