# グループを5件作成
# Group.create!(
#   name: "Animal Forest"
# )

# Group.create!(
#   name: "Animal Garden"
# )

# Group.create!(
#   name: "Animal Park"
# )

# Group.create!(
#   name: "Animal Hamaguchi"
# )

# Group.create!(
#   name: "Animal Sadara"
# )

# グループを5件作成
5.times do |n|
  Group.create(name: "Group #{n+1}")
end

# 管理人作成
User.create!(
  name: 'admin_user',
  email: 'admin_user@gmail.com',
  password: 'admin_user',
  encrypted_password: 'admin_user',
  admin: true
  group: group
  )

# グループごとにUserを5件ずつ作成する
Group.all.each do |group|
  5.times do |n|
    group.users.create!(
    name: "user#{n + 1}",
    email: "user#{n + 1}@gmail.com",
    password: "testuser#{n + 1}",
    group: group
    )
  end
end

# グループごとにScheduleを5件ずつ作成する
Group.all.each do |group|
  group.schedules.create(
    content: "おでん予防接種",
    start_time: Time.zone.now + 1.days
    group: group
  )
end

Group.all.each do |group|
  group.schedules.create(
    content: "キンパ手術",
    start_time: Time.zone.now + 3.days
    group: group
  )
end

Group.all.each do |group|
  group.schedules.create(
    content: "チェリー定期検診",
    start_time: Time.zone.now + 5.days
    group: group
  )
end

Group.all.each do |group|
  group.schedules.create(
    content: "ネロ定期検診",
    start_time: Time.zone.now + 7.days
    group: group
  )
end

Group.all.each do |group|
  group.schedules.create(
    content: "ビクター定期検診",
    start_time: Time.zone.now + 9.days
  )
end

# グループごとにAnimalを5件ずつ作成する
Group.all.each do |group|
  group.animals.create!(
    name: "おでん",
    birthday: rand(365 * 5).days.ago,
    sex: [true, false].sample,
    castration: [true, false].sample,
  )
end

Group.all.each do |group|
  group.animals.create!(
    name: "きんぱ",
    birthday: rand(365 * 5).days.ago,
    sex: [true, false].sample,
    castration: [true, false].sample,
  )
end

Group.all.each do |group|
  group.animals.create!(
    name: "チェリー",
    birthday: rand(365 * 5).days.ago,
    sex: [true, false].sample,
    castration: [true, false].sample,
  )
end

Group.all.each do |group|
  group.animals.create!(
    name: "ネロ",
    birthday: rand(365 * 5).days.ago,
    sex: [true, false].sample,
    castration: [true, false].sample,
  )
end

Group.all.each do |group|
  group.animals.create!(
    name: "ビクター",
    birthday: rand(365 * 5).days.ago,
    sex: [true, false].sample,
    castration: [true, false].sample,
  )
end

# グループごとにコメントを5件ずつ作成
Group.all.each do |group|
  group.comment_rooms.create!(
    content: "おでんの圧迫排尿しています",
  )
end

Group.all.each do |group|
  group.comment_rooms.create!(
    content: "チェリーが吐いたので病院行きます",
  )
end

Group.all.each do |group|
  group.comment_rooms.create!(
    content: "レスキュー依頼が来たので現場行ってきます",
  )
end

Group.all.each do |group|
  group.comment_rooms.create!(
    content: "キンパがご飯を食べないので病院行きます",
  )
end

Group.all.each do |group|
  group.comment_rooms.create!(
    content: "ネロの里親希望者さんのトライアルに行ってきます",
    group: group
  )
end

# グループごとにカルテを5件ずつ作成
Animal.all.each do |animal|
  5.times do |n|
    animal.animal_managements.create!(
      recorded_on: Time.zone.today - n.days,
      content: "朝食:ドライフード:20g<br>
                おやつ#{n+1}つ<br>
                トイレ#{n+1}回<br>
                夕食:ウェットフード:20g",
      temprature: (39.0),
      animal: animal
    )
  end
end