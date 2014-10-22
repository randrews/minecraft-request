class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :reddit_username
      t.string :minecraft_username
      t.string :status
      t.text :comment

      t.timestamps
    end
  end
end
