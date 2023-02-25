FactoryBot.define do
  factory :user do
    name { "sadara" }
    email { "sadara_1@gmail.com"}
    password { "sadaramutsumi" }
    password_confirmation { "sadaramutsumi" }
    admin {true}
    association :group
  end

  factory :second_user, class: User do
    name { "sadara" }
    email { "sadara_2@gmail.com"}
    password { "sadaramutsumi" }
    password_confirmation { "sadaramutsumi" }
    admin {false}
    association :group
  end
end