class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :address
      t.datetime :start_time
      t.datetime :end_time
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
