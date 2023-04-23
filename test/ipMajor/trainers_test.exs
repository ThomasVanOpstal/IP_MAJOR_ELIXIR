defmodule IpMajor.TrainersTest do
  use IpMajor.DataCase

  alias IpMajor.Trainers

  describe "trainers" do
    alias IpMajor.Trainers.Trainer

    import IpMajor.TrainersFixtures

    @invalid_attrs %{birthday: nil, comments: nil, email: nil, firstname: nil, lastname: nil, role: nil}

    test "list_trainers/0 returns all trainers" do
      trainer = trainer_fixture()
      assert Trainers.list_trainers() == [trainer]
    end

    test "get_trainer!/1 returns the trainer with given id" do
      trainer = trainer_fixture()
      assert Trainers.get_trainer!(trainer.id) == trainer
    end

    test "create_trainer/1 with valid data creates a trainer" do
      valid_attrs = %{birthday: ~D[2023-04-12], comments: "some comments", email: "some email", firstname: "some firstname", lastname: "some lastname", role: "some role"}

      assert {:ok, %Trainer{} = trainer} = Trainers.create_trainer(valid_attrs)
      assert trainer.birthday == ~D[2023-04-12]
      assert trainer.comments == "some comments"
      assert trainer.email == "some email"
      assert trainer.firstname == "some firstname"
      assert trainer.lastname == "some lastname"
      assert trainer.role == "some role"
    end

    test "create_trainer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trainers.create_trainer(@invalid_attrs)
    end

    test "update_trainer/2 with valid data updates the trainer" do
      trainer = trainer_fixture()
      update_attrs = %{birthday: ~D[2023-04-13], comments: "some updated comments", email: "some updated email", firstname: "some updated firstname", lastname: "some updated lastname", role: "some updated role"}

      assert {:ok, %Trainer{} = trainer} = Trainers.update_trainer(trainer, update_attrs)
      assert trainer.birthday == ~D[2023-04-13]
      assert trainer.comments == "some updated comments"
      assert trainer.email == "some updated email"
      assert trainer.firstname == "some updated firstname"
      assert trainer.lastname == "some updated lastname"
      assert trainer.role == "some updated role"
    end

    test "update_trainer/2 with invalid data returns error changeset" do
      trainer = trainer_fixture()
      assert {:error, %Ecto.Changeset{}} = Trainers.update_trainer(trainer, @invalid_attrs)
      assert trainer == Trainers.get_trainer!(trainer.id)
    end

    test "delete_trainer/1 deletes the trainer" do
      trainer = trainer_fixture()
      assert {:ok, %Trainer{}} = Trainers.delete_trainer(trainer)
      assert_raise Ecto.NoResultsError, fn -> Trainers.get_trainer!(trainer.id) end
    end

    test "change_trainer/1 returns a trainer changeset" do
      trainer = trainer_fixture()
      assert %Ecto.Changeset{} = Trainers.change_trainer(trainer)
    end
  end
end
