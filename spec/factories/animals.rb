FactoryBot.define do
  factory :animal do
    name { "animal1" }
    birthday { "2023-01-01" }
    association :group
  end
  factory :second_animal, class: Animal do
    name { "animal2" }
    birthday { "2023-01-02" }
    association :group
  end
end
