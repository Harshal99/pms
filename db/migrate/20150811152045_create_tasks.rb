class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.integer "project_id"
    	t.string "tname"
    	t.text "tdescrtion"
    	t.datetime "created_at"
    	t.datetime "updated_at"

      t.timestamps 
    end
  end
end
