alias IpMajor.{Reservation}
alias IpMajor.Repo

Repo.delete_all(Reservation)
reservation1 = %Reservation{date: ~D[2023-08-14],status: "confirmed",comments: "Ben een beginneling",duration: ~T[01:00:00],}

Repo.insert_all(Reservation, [reservation1])
