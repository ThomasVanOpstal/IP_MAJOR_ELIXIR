alias IpMajor.{Payment}
alias IpMajor.Repo

Repo.delete_all(Payment)
payment1 = %Payment{amount: 100.0,payment_date: ~D[2022-03-17],payment_status: "confirmed",payment_type: "cash",payment_reference: "123456789",payment_comments: "hondkathondkat",}
Repo.insert_all(Payment, [payment1])
