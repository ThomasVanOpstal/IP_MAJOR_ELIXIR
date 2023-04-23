defmodule IpMajorWeb.CourseLiveTest do
  use IpMajorWeb.ConnCase

  import Phoenix.LiveViewTest
  import IpMajor.CoursesFixtures

  @create_attrs %{comments: "some comments", description: "some description", duration: %{hour: 14, minute: 0}, max_participants: 42, min_participants: 42, name: "some name", price: 120.5, status: "some status"}
  @update_attrs %{comments: "some updated comments", description: "some updated description", duration: %{hour: 15, minute: 1}, max_participants: 43, min_participants: 43, name: "some updated name", price: 456.7, status: "some updated status"}
  @invalid_attrs %{comments: nil, description: nil, duration: %{hour: 14, minute: 0}, max_participants: nil, min_participants: nil, name: nil, price: nil, status: nil}

  defp create_course(_) do
    course = course_fixture()
    %{course: course}
  end

  describe "Index" do
    setup [:create_course]

    test "lists all courses", %{conn: conn, course: course} do
      {:ok, _index_live, html} = live(conn, Routes.course_index_path(conn, :index))

      assert html =~ "Listing Courses"
      assert html =~ course.comments
    end

    test "saves new course", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.course_index_path(conn, :index))

      assert index_live |> element("a", "New Course") |> render_click() =~
               "New Course"

      assert_patch(index_live, Routes.course_index_path(conn, :new))

      assert index_live
             |> form("#course-form", course: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#course-form", course: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.course_index_path(conn, :index))

      assert html =~ "Course created successfully"
      assert html =~ "some comments"
    end

    test "updates course in listing", %{conn: conn, course: course} do
      {:ok, index_live, _html} = live(conn, Routes.course_index_path(conn, :index))

      assert index_live |> element("#course-#{course.id} a", "Edit") |> render_click() =~
               "Edit Course"

      assert_patch(index_live, Routes.course_index_path(conn, :edit, course))

      assert index_live
             |> form("#course-form", course: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#course-form", course: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.course_index_path(conn, :index))

      assert html =~ "Course updated successfully"
      assert html =~ "some updated comments"
    end

    test "deletes course in listing", %{conn: conn, course: course} do
      {:ok, index_live, _html} = live(conn, Routes.course_index_path(conn, :index))

      assert index_live |> element("#course-#{course.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#course-#{course.id}")
    end
  end

  describe "Show" do
    setup [:create_course]

    test "displays course", %{conn: conn, course: course} do
      {:ok, _show_live, html} = live(conn, Routes.course_show_path(conn, :show, course))

      assert html =~ "Show Course"
      assert html =~ course.comments
    end

    test "updates course within modal", %{conn: conn, course: course} do
      {:ok, show_live, _html} = live(conn, Routes.course_show_path(conn, :show, course))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Course"

      assert_patch(show_live, Routes.course_show_path(conn, :edit, course))

      assert show_live
             |> form("#course-form", course: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#course-form", course: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.course_show_path(conn, :show, course))

      assert html =~ "Course updated successfully"
      assert html =~ "some updated comments"
    end
  end
end
