class AddBookTitleToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :book_title, :string
  end
end
