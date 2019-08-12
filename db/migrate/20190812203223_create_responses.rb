class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :text_body
      t.integer :upvotes

      t.timestamps
    end
  end
end
