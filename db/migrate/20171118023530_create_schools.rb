class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.belongs_to :user
      t.belongs_to :info
      
      t.timestamps null: false
    end
  end
end
