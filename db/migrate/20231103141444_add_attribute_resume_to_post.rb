class AddAttributeResumeToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :resume, :string
  end
end
