class AddemailTotasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :email, :string
  end
end
