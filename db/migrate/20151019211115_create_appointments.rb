class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.boolean :reminder
      t.string :reason
      t.belongs_to :doctor, index: true
      t.belongs_to :customer, index: true
      t.belongs_to :pet, index: true
      t.datetime :appointment_date

      t.timestamps null: false
    end
  end
end
