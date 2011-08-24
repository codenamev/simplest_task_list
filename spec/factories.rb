Factory.define :user do |f|
  f.sequence(:email) { |n| "jimmay#{n}@example"}
end