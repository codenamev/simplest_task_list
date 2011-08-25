class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  
  scope :active, where("completed_at IS NULL")
  scope :completed, where("completed_at IS NOT NULL")
end