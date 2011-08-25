Factory.define :user do |f|
  f.sequence(:email) { |n| "jimmay#{n}@example"}
end
Factory.define :task do |t|
  t.sequence(:title) { |n| "Some awesome task ##{n}"}
  t.parent_id 0
  t.description "Awesome description for this task"
  t.due_date 2.weeks.from_now
end
Factory.define :completed_task do |t|
  t.sequence(:title) { |n| "Some awesome task ##{n}"}
  t.parent_id 0
  t.description "Awesome description for this task"
  t.due_date 2.weeks.from_now
  t.completed_at Time.zone.now
end