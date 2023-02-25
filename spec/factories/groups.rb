FactoryBot.define do
  factory :group do
    name { "group1" }
  end
  factory :second_group, class: Group do
    name { "group2" }
  end
end
