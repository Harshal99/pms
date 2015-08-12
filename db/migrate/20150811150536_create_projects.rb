class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
   
    	t.string "name"
    	t.text "description"
    	t.datetime "created_at"
    	t.datetime "updated_at"

      t.timestamps 
    end
  end
end
