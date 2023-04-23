alias IpMajor.{Location}
alias IpMajor.Repo

Repo.delete_all(Location)

location = %Location{
  street: "J.P. Minckelersstraat",
  city: "Leuven",
  country: "Belgium",
  zip: "136",
  postal_code: "3000",
  comments: "J.P. Minckelersstraat 136, 3000 Leuven",
  latitude: 50.884604,
  longitude: 4.705394,
  description: "J.P. Minckelersstraat 136, 3000 Leuven"
}
Repo.insert! location
