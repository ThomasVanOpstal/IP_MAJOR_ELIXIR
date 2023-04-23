defmodule IpMajor.TrainersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IpMajor.Trainers` context.
  """

  @doc """
  Generate a trainer.
  """
  def trainer_fixture(attrs \\ %{}) do
    {:ok, trainer} =
      attrs
      |> Enum.into(%{
        birthday: ~D[2023-04-12],
        comments: "some comments",
        email: "some email",
        firstname: "some firstname",
        lastname: "some lastname",
        role: "some role"
      })
      |> IpMajor.Trainers.create_trainer()

    trainer
  end
end
