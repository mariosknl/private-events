class AddDesriptionToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :description, :string
  end
end
