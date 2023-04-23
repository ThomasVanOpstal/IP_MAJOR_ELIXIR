defmodule IpMajor.Contexts.Categorys do
  @moduledoc """
  The Categorys context.
  """

  import Ecto.Query, warn: false
  alias IpMajor.Repo

  alias IpMajor.Category
  @doc """
  Returns the list of categorys.

  ## Examples

      iex> list_categorys()
      [%Category{}, ...]

  """
  def list_categorys do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, ...}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, ...}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, ...}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns a data structure for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Todo{...}

  """
  def change_category(%Category{} = category, _attrs \\ %{}) do
    category
  end
end
