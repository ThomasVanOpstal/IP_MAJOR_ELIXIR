alias IpMajor.{Trainer}
alias IpMajor.Repo

Repo.delete_all(Trainer)
trainer = %Trainer{
  firstname: "emiel",
  lastname: "de smet",
  email: "emiel;desmet@gmail.com",
  birthday: ~D[1999-03-17],
  comments: "kan al met brommer rijden ",
}
Repo.insert_all(Trainer, [trainer1])
