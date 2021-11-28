class CreateMessageThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :message_threads do |t|
      t.integer :user_id_one
      t.integer :user_id_two
      t.string :user_name_one
      t.string :user_name_two

      t.timestamps
    end
  end
end
