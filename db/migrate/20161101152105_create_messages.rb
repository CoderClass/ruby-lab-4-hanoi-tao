class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :room_id
      t.string :username
      t.string :content

      t.timestamps
    end
  end
end
