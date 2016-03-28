class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.references :giver
      t.references :taker
      t.datetime :datetime
      t.boolean :covered, default: false
      t.timestamps
    end
  end
end