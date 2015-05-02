class CreateScreenings < ActiveRecord::Migration
  def change
    create_table :screenings do |t|
      t.time :screening_time
      t.date :screening_date
      t.integer :duration
      t.string :title
      t.string :director
      t.string :certificate
      t.string :genres
      t.string :country_of_origin
      t.integer :total_admissions
      t.integer :capacity
      t.timestamps null: false
    end
  end
end
