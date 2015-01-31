class CreateEdisons < ActiveRecord::Migration
  def change
    create_table :edisons do |t|

      t.timestamps null: false
    end
  end
end
