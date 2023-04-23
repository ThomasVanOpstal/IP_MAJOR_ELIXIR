defmodule IpMajor.CategorysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IpMajor.Categorys` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> IpMajor.Categorys.create_category()

    category
  end
end
