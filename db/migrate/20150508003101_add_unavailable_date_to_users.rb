class AddUnavailableDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unavailable_date, :date
  end
end
