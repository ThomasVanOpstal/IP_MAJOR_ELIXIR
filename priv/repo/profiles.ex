alias IpMajor.{Profile}
alias IpMajor.Repo

Repo.delete_all(Profile)

p1 = %Profile{firstname: "kat",lastname: "hond",email: "hond.kat@hotmail.com",birthday: ~D[1999-03-17],comments: "hondkathondkat"}

Repo.insert_all(Profile, [p1])
