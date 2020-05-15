Fighter.destroy_all
Gym.destroy_all
Session.destroy_all

f1 = Fighter.create(name:"Canelo", discipline:"boxing")
f2 = Fighter.create(name:"Floyd Mayweather", discipline:"boxing")
f3 = Fighter.create(name:"Manny Pacquiao", discipline:"boxing")


g1 = Gym.create(name: "Greg Jacksons MMA", address: "New Mexico")
g2 = Gym.create(name: "American Kick Boxing Academy", address: "Florida")
g3 = Gym.create(name: "Mayweather Boxing", address: "Las Vegas")


s1 = Session.create(date: "10/21/21", fighter_id: f1.id, gym_id: g1.id)
s2 = Session.create(date: "06/03/21", fighter_id: f2.id, gym_id: g2.id)
s3 = Session.create(date: "03/13/19", fighter_id: f3.id, gym_id: g3.id)