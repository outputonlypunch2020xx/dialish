FactoryBot.define do
  factory :user do
    name                  {"yamada"}
    email                 {"yamada@gmail.com"}
    password              {"yamada999"}
    encrypted_password    {"password"}
  end
end
