defmodule IpMajor.ProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IpMajor.Profiles` context.
  """

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        birthday: ~D[2023-04-11],
        comments: "some comments",
        email: "some email",
        firstname: "some firstname",
        lastname: "some lastname",
        role: "some role"
      })
      |> IpMajor.Profiles.create_profile()

    profile
  end
end
