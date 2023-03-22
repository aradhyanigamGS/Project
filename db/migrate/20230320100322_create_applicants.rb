class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email, null: false
      t.string :contact
      t.integer :age
      t.integer :experience
      t.string :role
      t.string :skills
      t.string :address
      t.string :state
      t.string :country
      t.string :pincode

      t.timestamps
    end
  end
end
