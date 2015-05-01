class AddVideoLinkToRecords < ActiveRecord::Migration
  def change
    add_column :records, :video_link, :string
  end
end
