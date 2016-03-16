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

end

[1,2,3].my_uniq
