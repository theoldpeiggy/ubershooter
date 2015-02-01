class CreateGpsMocks < ActiveRecord::Migration
  def change
    create_table :gps_mocks do |t|
      t.integer :step_index, default: 0
      t.text :lat_arr_str
      t.text :long_arr_str

      t.timestamps null: false
    end
  end
end
