class CreateTeslas < ActiveRecord::Migration
  def change
    create_table :teslas do |t|
      t.uri
      t.timestamps null: false
    end
  end
end
