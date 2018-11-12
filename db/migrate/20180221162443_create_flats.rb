class CreateFlats < ActiveRecord::Migration[5.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :price_per_night
      t.string :integer
      t.string :number_of_guests
      t.string :integer

      t.timestamps
    end
  end
end
