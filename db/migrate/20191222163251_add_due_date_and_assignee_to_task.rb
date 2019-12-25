class AddDueDateAndAssigneeToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :due_date, :date
    add_reference :tasks, :assignee, foreign_key: { to_table: :users }
  end
end
