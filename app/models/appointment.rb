class Appointment < ActiveRecord::Base
  belongs_to :doctor, :class_name => 'User'
  belongs_to :customer, :class_name => 'User'

  belongs_to :pet
end
