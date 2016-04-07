User.delete_all
Shift.delete_all
Offer.delete_all
Team.delete_all

t = Team.create(name: "Ladies")

r = User.new(name: "Roche", email: "rochej@gmail.com", password:"password")
m = User.new(name: "Megs", email: "megsluvstaliv@gmail.com", password: "password")
r.team = t
m.team = t

s = Shift.create(covered: false, datetime: DateTime.now)
s2 = Shift.create(covered:true, datetime: DateTime.now)

s.giver = r

s2.giver = m


o = Offer.new(type: "yes")
o.offerer_id = m.id
o.shift_id = s.id

o.save
s.save
s2.save
t.save
r.save
m.save
