class ChangeResumeAttributeToSummary < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :resume, :summary
  end
end
