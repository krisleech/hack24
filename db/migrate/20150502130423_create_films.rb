class CreateFilms < ActiveRecord::Migration
  # @title="A Little Chaos", @year=2014, @imdb_id="tt2639254", @type="movie", @rated=nil, @released=nil, @runtime=nil, @genre=nil, 
  # @director=nil, @writer=nil, @actors=nil, @plot=nil, @poster=nil, @metascore=nil, @language=nil, @country=nil, @awards=nil
  def change
    create_table :films do |t|
      t.string :title
      t.string :release_year
      t.integer :duration
      t.string :title
      t.string :director
      t.string :certificate
      t.string :genres
      t.string :country_of_origin
      t.string :writer
      t.string :actors
      t.string :poster
      t.string :metascore
      t.timestamps null: false
    end
  end
end
