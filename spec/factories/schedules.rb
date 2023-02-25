FactoryBot.define do
  factory :schedule do
    content { "予防接種" }
    start_time { "2023-01-01" }
    association :group
  end
  factory :second_schedule, class: Schedule do
    content { "避妊手術" }
    start_time { "2023-01-02" }
    association :group
  end
end