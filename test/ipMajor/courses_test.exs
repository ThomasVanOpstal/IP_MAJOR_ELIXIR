defmodule IpMajor.CoursesTest do
  use IpMajor.DataCase

  alias IpMajor.Courses

  describe "courses" do
    alias IpMajor.Courses.Course

    import IpMajor.CoursesFixtures

    @invalid_attrs %{comments: nil, description: nil, duration: nil, max_participants: nil, min_participants: nil, name: nil, price: nil, status: nil}

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert Courses.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert Courses.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      valid_attrs = %{comments: "some comments", description: "some description", duration: ~T[14:00:00], max_participants: 42, min_participants: 42, name: "some name", price: 120.5, status: "some status"}

      assert {:ok, %Course{} = course} = Courses.create_course(valid_attrs)
      assert course.comments == "some comments"
      assert course.description == "some description"
      assert course.duration == ~T[14:00:00]
      assert course.max_participants == 42
      assert course.min_participants == 42
      assert course.name == "some name"
      assert course.price == 120.5
      assert course.status == "some status"
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_course(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      update_attrs = %{comments: "some updated comments", description: "some updated description", duration: ~T[15:01:01], max_participants: 43, min_participants: 43, name: "some updated name", price: 456.7, status: "some updated status"}

      assert {:ok, %Course{} = course} = Courses.update_course(course, update_attrs)
      assert course.comments == "some updated comments"
      assert course.description == "some updated description"
      assert course.duration == ~T[15:01:01]
      assert course.max_participants == 43
      assert course.min_participants == 43
      assert course.name == "some updated name"
      assert course.price == 456.7
      assert course.status == "some updated status"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_course(course, @invalid_attrs)
      assert course == Courses.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = Courses.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = Courses.change_course(course)
    end
  end
end
