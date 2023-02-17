5.times do |n|
  User.create!(
    name: "mutsumisadara#{n + 1}",
    email: "mutsumisadara#{n + 1}@gmail.com",
    encrypted_password: "mutsumisadara#{n + 1}",
  )
end

user = User.create!(
  name: 'adminuser',
  email: 'adminuser@gmail.com',
  password: 'adminuser',
  encrypted_password: 'adminuser',
  admin: true
  )

5.times do |n|
  Group.create!(
    name: "Group#{n + 1}"
  )
end

5.times do |n|
  Animal.create!(
    name: "Animal#{n + 1}",
    sex: true,
    group_id: group.id
  )
end

5.times do |n|
  AnimalManagement.create!(
    title: "2023-02-28",
    content: "カルテ◎#{n + 1}",
    temprature: "39.0",
    animal_id: animal.id
  )
end

5.times do |n|
  start_day = Date.new(2023, 2, 1)
  end_day = Date.new(2023, 2, 28)
  Schedule.create!(
    content: "test",
    start_time: Random.rand(start_day..end_day)
    group_id: group.id
  )
end