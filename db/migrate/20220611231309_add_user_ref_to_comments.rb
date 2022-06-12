class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, column: :author_id, index: true, foreign_key: true
    end
end
