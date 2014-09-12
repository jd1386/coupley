class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
