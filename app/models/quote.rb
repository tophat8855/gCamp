class Quote
  attr_reader :quote, :quoter
  def initialize(quote, quoter)
    @quote = quote
    @quoter = quoter
  end
end
