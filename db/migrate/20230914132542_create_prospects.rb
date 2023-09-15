class CreateProspects < ActiveRecord::Migration[7.0]
  def change
    create_table :prospects do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :position
      t.string :company
      t.boolean :newsletter, default: false

      t.timestamps
    end
  end
end
