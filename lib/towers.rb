class Towers

  attr_accessor :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def won?
    towers[1] == [3,2,1] || towers[2] == [3,2,1]
  end

  def move(old_tower, new_tower)
    if valid_move?(old_tower, new_tower)
      new_tower << old_tower.pop
    else
      raise ArgumentError, "Invalid move"
    end
  end

  def valid_move?(old_tower, new_tower)
    return false if old_tower.empty?
    new_tower.empty? || old_tower.last < new_tower.last
  end


end
