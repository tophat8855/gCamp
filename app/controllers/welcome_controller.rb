class WelcomeController < ApplicationController
  def index
    @quotes = [
      Quote.new('"Failure is not an option. Everyone has to Suceed."', '- Arnold Schwarzenegger'),
      Quote.new('"Your time is limited, so don\'t waste it living someone else\'s life."', '- Steve Jobs'),
      Quote.new('"Better Ingredients, Better Pizza"', '- Papa John'),
    ]
  end

  # def csv_quotes
  #   CSV.foreach('app/assets/quotes.csv') do |row|
  #     Quote.new(row)
  #   end
  # end

end
