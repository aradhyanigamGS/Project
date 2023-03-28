class RemoveSkillsFromApplicant < ActiveRecord::Migration[6.1]
  def change
    remove_column :applicants, :skills
  end
end
