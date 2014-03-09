class CreateProspect < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
    	t.string :name, null: false
    	t.string :email
    	t.string :phone
    	t.text :inquiry, null: false
    	t.text :admin_comments
    	t.timestamps
    end
  end
end
