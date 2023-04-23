
alias IpMajor.{User}
alias IpMajor.Repo

Repo.delete_all(User)
user1 = %User{
username: "kat2000",
password: "peer",
}
Repo.insert_all(User, [user1])
