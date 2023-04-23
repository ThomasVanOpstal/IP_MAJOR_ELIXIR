alias IpMajor.{Category}
alias IpMajor.Repo

Repo.delete_all(Category)
category = %Category{
  name: "Opleiding rijinstructeur",
  description: "alle informatie in verband met het worden van een rijinstructeur"
}
Repo.insert_all(Category, [category1])
