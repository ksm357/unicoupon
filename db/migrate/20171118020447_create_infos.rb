class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :score
      t.integer :school_id
      t.string :schoolName
      t.string :title
      t.text :content
      t.string :address
      t.string :info_image_url
      t.string :url
      t.float :location_lat
      t.float :location_lng
      
      t.timestamps null: false
    end
  end
end
