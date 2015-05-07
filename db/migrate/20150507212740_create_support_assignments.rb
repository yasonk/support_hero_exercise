class CreateSupportAssignments < ActiveRecord::Migration
  def change
    create_table :support_assignments do |t|
      t.date :date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
