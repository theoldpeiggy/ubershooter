class CreateTeslas < ActiveRecord::Migration
  def change
    create_table :teslas do |t|
      t.timestamps null: false
    end
  end
end
