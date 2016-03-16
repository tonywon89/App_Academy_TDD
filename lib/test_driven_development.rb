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
end

p [1, -1].two_sums
