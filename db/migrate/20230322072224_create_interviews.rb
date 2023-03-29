class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.references :register, null: false, foreign_key: true
      t.references :applicant, null: false, foreign_key: true
      t.string :round
      t.string :timing
      t.integer :set_by
      t.text :feedback
      t.string :status

      t.timestamps
    end
  end
end
