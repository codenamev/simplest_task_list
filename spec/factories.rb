Factory.define :user do |f|
  f.sequence(:email) { |n| "jimmay#{n}@example"}
  f.password "0.0.0.0"
end