defmodule IpMajorWeb.TrainerLiveTest do
  use IpMajorWeb.ConnCase

  import Phoenix.LiveViewTest
  import IpMajor.TrainersFixtures

  @create_attrs %{birthday: %{day: 12, month: 4, year: 2023}, comments: "some comments", email: "some email", firstname: "some firstname", lastname: "some lastname", role: "some role"}
  @update_attrs %{birthday: %{day: 13, month: 4, year: 2023}, comments: "some updated comments", email: "some updated email", firstname: "some updated firstname", lastname: "some updated lastname", role: "some updated role"}
  @invalid_attrs %{birthday: %{day: 30, month: 2, year: 2023}, comments: nil, email: nil, firstname: nil, lastname: nil, role: nil}

  defp create_trainer(_) do
    trainer = trainer_fixture()
    %{trainer: trainer}
  end

  describe "Index" do
    setup [:create_trainer]

    test "lists all trainers", %{conn: conn, trainer: trainer} do
      {:ok, _index_live, html} = live(conn, Routes.trainer_index_path(conn, :index))

      assert html =~ "Listing Trainers"
      assert html =~ trainer.comments
    end

    test "saves new trainer", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.trainer_index_path(conn, :index))

      assert index_live |> element("a", "New Trainer") |> render_click() =~
               "New Trainer"

      assert_patch(index_live, Routes.trainer_index_path(conn, :new))

      assert index_live
             |> form("#trainer-form", trainer: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#trainer-form", trainer: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.trainer_index_path(conn, :index))

      assert html =~ "Trainer created successfully"
      assert html =~ "some comments"
    end

    test "updates trainer in listing", %{conn: conn, trainer: trainer} do
      {:ok, index_live, _html} = live(conn, Routes.trainer_index_path(conn, :index))

      assert index_live |> element("#trainer-#{trainer.id} a", "Edit") |> render_click() =~
               "Edit Trainer"

      assert_patch(index_live, Routes.trainer_index_path(conn, :edit, trainer))

      assert index_live
             |> form("#trainer-form", trainer: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#trainer-form", trainer: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.trainer_index_path(conn, :index))

      assert html =~ "Trainer updated successfully"
      assert html =~ "some updated comments"
    end

    test "deletes trainer in listing", %{conn: conn, trainer: trainer} do
      {:ok, index_live, _html} = live(conn, Routes.trainer_index_path(conn, :index))

      assert index_live |> element("#trainer-#{trainer.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#trainer-#{trainer.id}")
    end
  end

  describe "Show" do
    setup [:create_trainer]

    test "displays trainer", %{conn: conn, trainer: trainer} do
      {:ok, _show_live, html} = live(conn, Routes.trainer_show_path(conn, :show, trainer))

      assert html =~ "Show Trainer"
      assert html =~ trainer.comments
    end

    test "updates trainer within modal", %{conn: conn, trainer: trainer} do
      {:ok, show_live, _html} = live(conn, Routes.trainer_show_path(conn, :show, trainer))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Trainer"

      assert_patch(show_live, Routes.trainer_show_path(conn, :edit, trainer))

      assert show_live
             |> form("#trainer-form", trainer: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#trainer-form", trainer: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.trainer_show_path(conn, :show, trainer))

      assert html =~ "Trainer updated successfully"
      assert html =~ "some updated comments"
    end
  end
end
