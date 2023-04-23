defmodule IpMajor.PaymentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IpMajor.Payments` context.
  """

  @doc """
  Generate a payment.
  """
  def payment_fixture(attrs \\ %{}) do
    {:ok, payment} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        payment_date: ~D[2023-04-12],
        payment_method: "some payment_method",
        payment_reference: "some payment_reference",
        payment_status: "some payment_status",
        payment_type: "some payment_type",
        paymeny_comments: "some paymeny_comments"
      })
      |> IpMajor.Payments.create_payment()

    payment
  end
end
