defmodule IpMajor.ProfilesTest do
  use IpMajor.DataCase

  alias IpMajor.Profiles

  describe "profiles" do
    alias IpMajor.Profiles.Profile

    import IpMajor.ProfilesFixtures

    @invalid_attrs %{birthday: nil, comments: nil, email: nil, firstname: nil, lastname: nil, role: nil}

    test "list_profiles/0 returns all profiles" do
      profile = profile_fixture()
      assert Profiles.list_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert Profiles.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      valid_attrs = %{birthday: ~D[2023-04-11], comments: "some comments", email: "some email", firstname: "some firstname", lastname: "some lastname", role: "some role"}

      assert {:ok, %Profile{} = profile} = Profiles.create_profile(valid_attrs)
      assert profile.birthday == ~D[2023-04-11]
      assert profile.comments == "some comments"
      assert profile.email == "some email"
      assert profile.firstname == "some firstname"
      assert profile.lastname == "some lastname"
      assert profile.role == "some role"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profiles.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      update_attrs = %{birthday: ~D[2023-04-12], comments: "some updated comments", email: "some updated email", firstname: "some updated firstname", lastname: "some updated lastname", role: "some updated role"}

      assert {:ok, %Profile{} = profile} = Profiles.update_profile(profile, update_attrs)
      assert profile.birthday == ~D[2023-04-12]
      assert profile.comments == "some updated comments"
      assert profile.email == "some updated email"
      assert profile.firstname == "some updated firstname"
      assert profile.lastname == "some updated lastname"
      assert profile.role == "some updated role"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Profiles.update_profile(profile, @invalid_attrs)
      assert profile == Profiles.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = Profiles.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> Profiles.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = Profiles.change_profile(profile)
    end
  end
end