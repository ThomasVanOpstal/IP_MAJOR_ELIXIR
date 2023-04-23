# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IpMajor.Repo.insert!(%IpMajor.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
"""
alias IpMajor.{User, Profile, Location, Course, Category, Payment, Reservation, Trainer, Repo}
alias IpMajor.Repo

# relation between user and profile

user = Repo.get(User, 1)
p = Repo.get(Profile, 1)
profile = Ecto.build_assoc(user, :profile, p)
Repo.insert! profile

# relation user and reservation
r = Repo.get(Reservation, 1)
reservation = Ecto.build_assoc(user, :reservation, r)
Repo.insert! reservation

# relation between reservation and payment
p= Repo.get(Payment, 1)
p = Ecto.build_assoc(Repo.get(reservation, 1), :payment, p)
Repo.insert! p
# relation between reservation and course

course = Repo.get(Course, 11) |> Repo.preload(:reservation)
reservation = Repo.get(Reservation, 1) |> Repo.preload(:course)
course_changeset = Ecto.Changeset.change(course)
course_with_reservation = Ecto.Changeset.put_assoc(course_changeset, :reservation,[reservation])
Repo.update!(course_with_reservation)


# relation between course and Location
c = Repo.get(Course, 11)
course = Ecto.build_assoc(location, :course, c)
Repo.insert(course)
# relation between course and Category
course = Repo.get!(Course, 11) |> Repo.preload(:category)
category  = Repo.get!(Category, 1) |> Repo.preload(:course)
course_changeset = Ecto.Changeset.change(course)
course_with_category = Ecto.Changeset.put_assoc(course_changeset, :category,[category])
Repo.update!(course_with_category)
# relation between course and Trainer
course = Repo.get!(Course, 11) |> Repo.preload(:trainer)
trainer  = Repo.get!(Trainer, 1) |> Repo.preload(:course)
course_changeset = Ecto.Changeset.change(course)
course_with_trainer = Ecto.Changeset.put_assoc(course_changeset, :trainer,[trainer])
Repo.update!(course_with_trainer)
"""
