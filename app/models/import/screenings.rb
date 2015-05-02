require 'csv'

module Import
  class Screenings
    def self.call
      # import data from CSV file
      CSV.read('/Users/krisleech/dev/turnover/films.csv').each do |line|
        next if line[0] == 'Screening_Date' # header

        screening = Screening.new

        [:screening_date,
         :screening_time,
         :duration,
         :title,
         :director,
         :certificate,
         :genres,
         :country_of_origin,
         :total_admissions,
         :capacity].each_with_index do |key, index|
           screening.send("#{key}=", line[index])
         end

         screening.save!
      end
    end
  end
end
