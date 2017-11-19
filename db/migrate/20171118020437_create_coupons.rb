class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      
      t.integer :user_id
      t.integer :count

      t.timestamps null: false
    end
  end
end
