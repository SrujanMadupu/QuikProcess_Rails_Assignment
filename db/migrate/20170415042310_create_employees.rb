class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
    	t.string "name", :limit => 35,:null => false
    	t.string "company", :limit => 50
    	t.string "email", :null => false
    	t.decimal "phone", :limit => 10


      t.timestamps
    end
  end
end
