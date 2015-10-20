class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :doctors, ->{ where(role_type: 'Doctor') }
  scope :customers, ->{ where(role_type: 'Customer') }

  has_many :customer_appointments, :class_name => 'Appointment', :foreign_key => 'customer_id'
  has_many :doctor_appointments, :class_name => 'Appointment', :foreign_key => 'doctor_id'

  has_many :pets

private
  def self.all_except(user)
    where.not(id: user)
  end
end
