FactoryBot.define do
  factory :comment_room do
    content { "comment1" }
    association :group
  end
  factory :second_comment_room, class: CommentRoom do
    content { "comment2" }
    association :group
  end
end