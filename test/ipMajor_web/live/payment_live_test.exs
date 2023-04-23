defmodule IpMajorWeb.PaymentLiveTest do
  use IpMajorWeb.ConnCase

  import Phoenix.LiveViewTest
  import IpMajor.PaymentsFixtures

  @create_attrs %{amount: 120.5, payment_date: %{day: 12, month: 4, year: 2023}, payment_method: "some payment_method", payment_reference: "some payment_reference", payment_status: "some payment_status", payment_type: "some payment_type", paymeny_comments: "some paymeny_comments"}
  @update_attrs %{amount: 456.7, payment_date: %{day: 13, month: 4, year: 2023}, payment_method: "some updated payment_method", payment_reference: "some updated payment_reference", payment_status: "some updated payment_status", payment_type: "some updated payment_type", paymeny_comments: "some updated paymeny_comments"}
  @invalid_attrs %{amount: nil, payment_date: %{day: 30, month: 2, year: 2023}, payment_method: nil, payment_reference: nil, payment_status: nil, payment_type: nil, paymeny_comments: nil}

  defp create_payment(_) do
    payment = payment_fixture()
    %{payment: payment}
  end

  describe "Index" do
    setup [:create_payment]

    test "lists all payments", %{conn: conn, payment: payment} do
      {:ok, _index_live, html} = live(conn, Routes.payment_index_path(conn, :index))

      assert html =~ "Listing Payments"
      assert html =~ payment.payment_method
    end

    test "saves new payment", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.payment_index_path(conn, :index))

      assert index_live |> element("a", "New Payment") |> render_click() =~
               "New Payment"

      assert_patch(index_live, Routes.payment_index_path(conn, :new))

      assert index_live
             |> form("#payment-form", payment: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#payment-form", payment: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.payment_index_path(conn, :index))

      assert html =~ "Payment created successfully"
      assert html =~ "some payment_method"
    end

    test "updates payment in listing", %{conn: conn, payment: payment} do
      {:ok, index_live, _html} = live(conn, Routes.payment_index_path(conn, :index))

      assert index_live |> element("#payment-#{payment.id} a", "Edit") |> render_click() =~
               "Edit Payment"

      assert_patch(index_live, Routes.payment_index_path(conn, :edit, payment))

      assert index_live
             |> form("#payment-form", payment: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#payment-form", payment: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.payment_index_path(conn, :index))

      assert html =~ "Payment updated successfully"
      assert html =~ "some updated payment_method"
    end

    test "deletes payment in listing", %{conn: conn, payment: payment} do
      {:ok, index_live, _html} = live(conn, Routes.payment_index_path(conn, :index))

      assert index_live |> element("#payment-#{payment.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#payment-#{payment.id}")
    end
  end

  describe "Show" do
    setup [:create_payment]

    test "displays payment", %{conn: conn, payment: payment} do
      {:ok, _show_live, html} = live(conn, Routes.payment_show_path(conn, :show, payment))

      assert html =~ "Show Payment"
      assert html =~ payment.payment_method
    end

    test "updates payment within modal", %{conn: conn, payment: payment} do
      {:ok, show_live, _html} = live(conn, Routes.payment_show_path(conn, :show, payment))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Payment"

      assert_patch(show_live, Routes.payment_show_path(conn, :edit, payment))

      assert show_live
             |> form("#payment-form", payment: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#payment-form", payment: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.payment_show_path(conn, :show, payment))

      assert html =~ "Payment updated successfully"
      assert html =~ "some updated payment_method"
    end
  end
end
