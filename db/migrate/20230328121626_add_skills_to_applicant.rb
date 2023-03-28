class AddSkillsToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :skills, :string ,array: true, default: []
  end
end
