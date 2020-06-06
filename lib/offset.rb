class Offset
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def date_squared
    date.to_i * date.to_i
  end
end
