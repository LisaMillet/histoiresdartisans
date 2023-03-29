class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :date
      t.string :introduction
      t.string :banner_picture
      t.string :first_paragraph
      t.string :first_picture
      t.string :second_paragraph
      t.string :second_picture
      t.string :third_paragraph
      t.string :third_picture
      t.string :fourth_paragraph
      t.string :fourth_picture
      t.string :fifth_paragraph
      t.string :fifth_picture

      t.timestamps
    end
  end
end
