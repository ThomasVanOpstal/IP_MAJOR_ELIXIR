defmodule IpMajor.CoursesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IpMajor.Courses` context.
  """

  @doc """
  Generate a course.
  """
  def course_fixture(attrs \\ %{}) do
    {:ok, course} =
      attrs
      |> Enum.into(%{
        comments: "some comments",
        description: "some description",
        duration: ~T[14:00:00],
        max_participants: 42,
        min_participants: 42,
        name: "some name",
        price: 120.5,
        status: "some status"
      })
      |> IpMajor.Courses.create_course()

    course
  end
end
