require 'byebug'
class Array

  def my_uniq
    unique = []
    self.each do |el|
      unique << el unless unique.include?(el)
    end
    p unique
    unique
  end

  def two_sums
    pairs = []

    self.each_with_index do |num1, i|
      self[i+1..-1].each_with_index do |num2, j|
        pairs << [i, j + i + 1] if num1 + num2 == 0
      end
    end

    pairs
  end

  def my_transpose
    return [] if empty?
    raise ArgumentError if any? { |el| !el.is_a?(Array) }
    transposed = Array.new(first.length) { Array.new }
    i = 0
    while i < transposed.length
      self.each do |row|
        transposed[i] << row[i]
      end
      i += 1
    end
    transposed
  end
end

def stock_picker(prices)
  return nil if prices.size < 2
  best_pair = nil
  highest_profit = nil
  prices.each_with_index do |current_price, c_day|
    current_profit =  nil
    prices.drop(c_day+1).each_with_index do |future_price, f_day|
      current_profit = future_price - current_price
      if highest_profit.nil? || current_profit > highest_profit
        highest_profit = current_profit
        best_pair = [c_day, (f_day + c_day + 1)]
      end
    end
  end
  best_pair
end
