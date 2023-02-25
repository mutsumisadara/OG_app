FactoryBot.define do
  factory :animal_management do
    recorded_on { "2023-01-01" }
    content { "朝食 20g" }
    temprature { "39.0" }
    association :animal
  end
  factory :second_animal_management, class: AnimalManagement do
    recorded_on { "2023-01-02" }
    content { "夕食 20g" }
    temprature { "39.5" }
    association :animal
  end
end
