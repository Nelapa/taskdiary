class Task < ActiveRecord::Base
  validates_presence_of :name, :due
end
