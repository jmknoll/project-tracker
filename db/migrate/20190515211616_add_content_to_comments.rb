class AddContentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :date, :date
    add_column :comments, :content, :text
  end
end
