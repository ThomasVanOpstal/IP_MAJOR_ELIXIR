defmodule IpMajor.Contexts.Profiles do
  @moduledoc """
  The Profiles context.
  """

  import Ecto.Query, warn: false
  alias IpMajor.Repo
  alias IpMajor.Profile


  @doc """
  Returns the list of profiles.

  ## Examples

      iex> list_profiles()
      [%Profile{}, ...]

  """
  def list_profiles do
    Repo.all(Profile)

  end

  @doc """
  Gets a single profile.

  Raises if the Profile does not exist.

  ## Examples

      iex> get_profile!(123)
      %Profile{}

  """
  def get_profile!(id), do: raise "TODO"

  @doc """
  Creates a profile.

  ## Examples

      iex> create_profile(%{field: value})
      {:ok, %Profile{}}

      iex> create_profile(%{field: bad_value})
      {:error, ...}

  """
  def create_profile(attrs \\ %{}) do
    raise "TODO"
  end

  @doc """
  Updates a profile.

  ## Examples

      iex> update_profile(profile, %{field: new_value})
      {:ok, %Profile{}}

      iex> update_profile(profile, %{field: bad_value})
      {:error, ...}

  """
  def update_profile(%Profile{} = profile, attrs) do

  end

  @doc """
  Deletes a Profile.

  ## Examples

      iex> delete_profile(profile)
      {:ok, %Profile{}}

      iex> delete_profile(profile)
      {:error, ...}

  """
  def delete_profile(%Profile{} = profile) do

  end

  @doc """
  Returns a data structure for tracking profile changes.

  ## Examples

      iex> change_profile(profile)
      %Todo{...}

  """
  def change_profile(%Profile{} = profile, _attrs \\ %{}) do

  end
end
