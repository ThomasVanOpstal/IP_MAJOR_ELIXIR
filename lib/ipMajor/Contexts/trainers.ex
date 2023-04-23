defmodule IpMajor.Contexts.Trainers do
  @moduledoc """
  The Trainers context.
  """

  import Ecto.Query, warn: false
  alias IpMajor.Repo

  alias IpMajor.Trainer
  @doc """
  Returns the list of trainers.

  ## Examples

      iex> list_trainers()
      [%Trainer{}, ...]

  """
  def list_trainers do
    Repo.all(Trainer)
  end

  @doc """
  Gets a single trainer.

  Raises if the Trainer does not exist.

  ## Examples

      iex> get_trainer!(123)
      %Trainer{}

  """
  def get_trainer!(id), do: Repo.get!(Trainer, id)

  @doc """
  Creates a trainer.

  ## Examples

      iex> create_trainer(%{field: value})
      {:ok, %Trainer{}}

      iex> create_trainer(%{field: bad_value})
      {:error, ...}

  """
  def create_trainer(attrs \\ %{}) do
    %Trainer{}
    |> Trainer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trainer.

  ## Examples

      iex> update_trainer(trainer, %{field: new_value})
      {:ok, %Trainer{}}

      iex> update_trainer(trainer, %{field: bad_value})
      {:error, ...}

  """
  def update_trainer(%Trainer{} = trainer, attrs) do
    trainer
    |> Trainer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Trainer.

  ## Examples

      iex> delete_trainer(trainer)
      {:ok, %Trainer{}}

      iex> delete_trainer(trainer)
      {:error, ...}

  """
  def delete_trainer(%Trainer{} = trainer) do
    Repo.delete(trainer)
  end

  @doc """
  Returns a data structure for tracking trainer changes.

  ## Examples

      iex> change_trainer(trainer)
      %Todo{...}

  """
  def change_trainer(%Trainer{} = trainer, _attrs \\ %{}) do
    trainer
  end
end
