class RemoveBookTitleFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :book_title, :string
  end
end
