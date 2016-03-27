class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :shift
      t.references :offerer
      t.string :type
      t.timestamps
    end
  end
end
