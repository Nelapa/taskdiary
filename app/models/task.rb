class Task < ActiveRecord::Base
  validates_presence_of :name, :due
  
  belongs_to :user
end
