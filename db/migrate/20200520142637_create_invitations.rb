class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :attended_id
      t.integer :attended_event_id
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
