defmodule IpMajor.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainers" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :role, :string #trainer
    field :birthday, :date
    field :comments, :string
    many_to_many :course, IpMajor.Course, join_through: "course_trainers"
    timestamps()
  end

end
