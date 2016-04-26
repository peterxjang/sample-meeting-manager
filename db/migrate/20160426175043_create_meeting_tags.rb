class CreateMeetingTags < ActiveRecord::Migration
  def change
    create_table :meeting_tags do |t|
      t.integer :meeting_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
