class ChangePositionColumnInProspects < ActiveRecord::Migration[7.0]
  def change
    remove_column :prospects, :position
    add_column :prospects, :position, :integer
  end
end
