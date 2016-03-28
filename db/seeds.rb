User.delete_all
Shift.delete_all
Offer.delete_all


r = User.create(name: "Roche", email: "rochej@gmail.com", password:"password")
m = User.create(name: "Megs", email: "megsluvstaliv@gmail.com", password: "password")

s = Shift.create(covered: false)
s2 = Shift.create(covered:true)

o = Offer.create()

s.giver = r
s.taker = m

s2.giver = m
s2.taker = r

s.save
s2.save
