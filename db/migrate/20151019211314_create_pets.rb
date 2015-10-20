class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :pet_type
      t.string :breed
      t.integer :y_age
      t.integer :m_age
      t.integer :weight
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
