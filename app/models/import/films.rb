module Import
  class Films
    def self.call
      rotten
      # broadway
      # omdb
    end

    def self.rotten

      film_titles.map do |title|

        # http://api.rottentomatoes.com
        conn = Faraday.new(:url => 'http://api.rottentomatoes.com') do |faraday|
          faraday.request  :url_encoded             # form-encode POST params
          faraday.response :logger                  # log requests to STDOUT
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end

        response = conn.get '/api/public/v1.0/movies.json?apikey=cy7a2ctphsg672sf39xuw79q&q=Toy+Story+3&page_limit=1'     # GET http://sushi.com/nigiri/sake.json
        response.body

        require 'pry'
        binding.pry

        film = Film.find_by_title(title) || Film.new(title: title)

        binding.pry

        sleep 1
      end

    end

    def self.broadway
      film_titles.map do |title|
        begin
          screening = screenings.find { |s| s.title == title }
          film = Film.find_by_title(title) || Film.new(title: title)
          %w(duration director certificate genres country_of_origin).each do |key|
            film.send("#{key}=", screening.send(key))
          end
          film.save
        rescue
          binding.pry
        end
      end
    end

    def self.screenings
      @screening ||= Screening.all
    end

    def self.omdb

      film_titles.each do |title|
        begin
          film = Film.find_by_title(title) || Film.new(title: title)

          film_data = Omdb::Api.new.search(title)[:movies].find { |movie| movie.title == title }

          if film
            %w(writer actors poster metascore).each do |key|
              film.send("#{key}=", film_data.send(key)) if film.send(key).blank?
            end
          end

          film.save!
        rescue
          binding.pry
        end
      end
    end

    def self.film_titles
      @film_titles ||= Screening.all.map { |s| s.title }.uniq
    end

    def self.get_broadway_data(title)
      Screening.all.find { |s| s.title == title }
    end
  end
end
