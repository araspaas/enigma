require 'date'

class Offset
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def date_squared
    date.to_i * date.to_i
  end

  def create_offset
    {
      A: date_squared.to_s[-4].to_i,
      B: date_squared.to_s[-3].to_i,
      C: date_squared.to_s[-2].to_i,
      D: date_squared.to_s[-1].to_i
    }
  end
end
