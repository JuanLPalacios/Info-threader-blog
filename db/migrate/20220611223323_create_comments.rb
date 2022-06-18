class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.bigint :author_id, index: true

      t.timestamps
    end
  end
end
