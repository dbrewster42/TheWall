FactoryBot.define do
  factory :comment do
    content { "This is a comment" }
    user { "John" }
    message { "This is a message" }
  end
end
