alias IpMajor.{Course}
alias IpMajor.Repo

Repo.delete_all(Course)


c1 = %Course{name: "Basisopleiding rijinstructeur", description: "Deze opleiding is bedoeld voor mensen die een rijopleiding willen geven.", price: 150.0, duration: ~T[12:00:00], max_participants: 10,min_participants: 2, status: "open", comments: "Basisopleiding rijinstructeur", }


c2= %Course{
  name: "Praktijkles",
  description: "Rijles met leswagen",
  price: 55.0,
  duration: ~T[01:00:00],
  max_participants: 1,
  min_participants: 1,
  status: "open",
  comments: "Basiscursus met leswagen"
}

c3 = %Course{
  name: "Praktijkles",
  description: "Rijles met eigen wagen",
  price: 40.0,
  duration: ~T[01:00:00],
  max_participants: 1,
  min_participants: 1,
  status: "open",
  comments: "Basiscrsus met eigen wagen"
}

c4 = %Course{
  name: "Examenbegeleiding",
  description: "Examenbegeleiding met leswagen",
  price: 130.0,
  duration: ~T[00:00:00],
  max_participants: 1,
  min_participants: 1,
  status: "open",
  comments: "Examenbegeleiding met leswagen"
}
Repo.insert_all(Course, [c1, c2, c3, c4])
