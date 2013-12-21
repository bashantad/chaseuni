FactoryGirl.define do
  factory :user do |u|
    u.full_name "Bashanta Dahal"
    u.sequence(:email){|n| "test#{n}@gmail.com"}
    u.password 'test1234'
    u.password_confirmation 'test1234'
  end
  
  factory :faculty do |f|
    f.title "Computer Science"
    f.description "Study of Computer Science"
  end
  
  factory :course do |c|
    c.title "Political Science"
    c.description "Study of politics"
    c.level 2
    c.association :faculty, factory: :faculty
    c.association :user, factory: :user
  end
end