User.delete_all
Shift.delete_all
Offer.delete_all


r = User.create(name: "Roche")
m = User.create(name: "Megs")

s = Shift.create()

o = Offer.create()

s.giver = r
s.taker = m

s.save
