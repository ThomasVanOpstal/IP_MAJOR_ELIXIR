defmodule IpMajor.Contexts.ProfileContext do
  alias IpMajor.Profile
  alias IpMajor.Repo

  def change_profile(%Profile{} = profile) do
    profile
    |> Profile.changeset(%{})
  end

  def create_profile(attr, user) do
    %Profile{}
    |> Profile.changeset(attr)
    |> Repo.insert()
    |> case do
      {:ok, profile} ->
        add_profile_to_user(profile, user)
      {:error, %Ecto.Changeset{} = changeset} ->
        {:error, changeset}
    end
  end

  def list_profiles do
    Repo.all(Profile)
  end

  def get_profile!(id), do: Repo.get!(Profile, id)

  def update_profile(%Profile{} = profile, attrs) do
    profile
    |> Profile.changeset(attrs)
    |> Repo.update()
  end
  def delete_profile(%Profile{} = profile) do
    Repo.delete(profile)
  end

  def add_profile_to_user(profile, user) do
    profile = Repo.preload(profile, :user)
    profile
    |> Profile.add_user(user)
    |> Repo.update()
  end
end
