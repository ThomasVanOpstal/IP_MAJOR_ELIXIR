defmodule IpMajor.PaymentsTest do
  use IpMajor.DataCase

  alias IpMajor.Payments

  describe "payments" do
    alias IpMajor.Payments.Payment

    import IpMajor.PaymentsFixtures

    @invalid_attrs %{amount: nil, payment_date: nil, payment_method: nil, payment_reference: nil, payment_status: nil, payment_type: nil, paymeny_comments: nil}

    test "list_payments/0 returns all payments" do
      payment = payment_fixture()
      assert Payments.list_payments() == [payment]
    end

    test "get_payment!/1 returns the payment with given id" do
      payment = payment_fixture()
      assert Payments.get_payment!(payment.id) == payment
    end

    test "create_payment/1 with valid data creates a payment" do
      valid_attrs = %{amount: 120.5, payment_date: ~D[2023-04-12], payment_method: "some payment_method", payment_reference: "some payment_reference", payment_status: "some payment_status", payment_type: "some payment_type", paymeny_comments: "some paymeny_comments"}

      assert {:ok, %Payment{} = payment} = Payments.create_payment(valid_attrs)
      assert payment.amount == 120.5
      assert payment.payment_date == ~D[2023-04-12]
      assert payment.payment_method == "some payment_method"
      assert payment.payment_reference == "some payment_reference"
      assert payment.payment_status == "some payment_status"
      assert payment.payment_type == "some payment_type"
      assert payment.paymeny_comments == "some paymeny_comments"
    end

    test "create_payment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Payments.create_payment(@invalid_attrs)
    end

    test "update_payment/2 with valid data updates the payment" do
      payment = payment_fixture()
      update_attrs = %{amount: 456.7, payment_date: ~D[2023-04-13], payment_method: "some updated payment_method", payment_reference: "some updated payment_reference", payment_status: "some updated payment_status", payment_type: "some updated payment_type", paymeny_comments: "some updated paymeny_comments"}

      assert {:ok, %Payment{} = payment} = Payments.update_payment(payment, update_attrs)
      assert payment.amount == 456.7
      assert payment.payment_date == ~D[2023-04-13]
      assert payment.payment_method == "some updated payment_method"
      assert payment.payment_reference == "some updated payment_reference"
      assert payment.payment_status == "some updated payment_status"
      assert payment.payment_type == "some updated payment_type"
      assert payment.paymeny_comments == "some updated paymeny_comments"
    end

    test "update_payment/2 with invalid data returns error changeset" do
      payment = payment_fixture()
      assert {:error, %Ecto.Changeset{}} = Payments.update_payment(payment, @invalid_attrs)
      assert payment == Payments.get_payment!(payment.id)
    end

    test "delete_payment/1 deletes the payment" do
      payment = payment_fixture()
      assert {:ok, %Payment{}} = Payments.delete_payment(payment)
      assert_raise Ecto.NoResultsError, fn -> Payments.get_payment!(payment.id) end
    end

    test "change_payment/1 returns a payment changeset" do
      payment = payment_fixture()
      assert %Ecto.Changeset{} = Payments.change_payment(payment)
    end
  end
end
