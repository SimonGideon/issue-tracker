FactoryBot.define do
  factory :issue do
    title { "MyString" }
    status { "MyString" }
    priority { 1 }
    project { nil }
  end
end
