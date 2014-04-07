class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :number
    end

    create_table :lines do |t|
      t.integer :number
    end
  end
end
