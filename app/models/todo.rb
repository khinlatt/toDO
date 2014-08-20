class Todo < ActiveRecord::Base
  validates_presence_of :user_id

  has_many :items
end
