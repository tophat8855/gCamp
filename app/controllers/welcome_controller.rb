class WelcomeController < ApplicationController
  def index
    @quotes = [
      Quote.new('"Failure is not an option. Everyone has to Suceed."', '- Arnold Schwarzenegger'),
      Quote.new('"Your time is limited, so don\'t waste it living someone else\'s life."', '- Steve Jobs'),
      Quote.new('"Better Ingredients, Better Pizza"', '- Papa John'),
    ]
  end


  ## USE THIS INDEX METHOD IF USING CSV FILE TO IMPORT QUOTES ##
  #
  # def index
  #   @quotes = CSV.read('app/assets/quotes.csv')
  # end

  ## And put this in the view instead of the other ul (posting it here because it's difficult to comment out html cleanly)
  #
  # <ul class="list-unstyled">
  # <% @quotes.each do |saying| %>
  #   <p>
  #   <strong>
  #   <%= saying[0] %>
  #   </strong>
  #   <em>
  #   <%= saying[1] %>
  #   </em>
  #   </p>
  #   <% end %>
  #   </ul>



  #### JSON FILE IMPORT CODE ### USE THIS INDEX ACTION IF USING JSON FILE FOR QUOTES

  # def index
  #   @quotes = JSON.parse(File.read('app/assets/quotes.json'))
  # end

  ## SIMILAR TO CSV ABOVE, COPY/PASTE THIS HTML CODE INTO WELCOME INDEX WHERE THE <ul class> IS

  # <ul class="list-unstyled">
  # <% @quotes.each_pair do |saying, sayer| %>
  #   <p>
  #   <strong><%= saying %></strong>
  #   <em><%= sayer %></em>
  #   </p>
  #   <% end %>
  #   </ul>

end
