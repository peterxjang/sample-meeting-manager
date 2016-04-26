class AddNotesToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :notes, :text
  end
end
