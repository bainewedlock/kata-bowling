class Bowling
  def initialize
    @rolls = []
  end
  def roll(pins)
    @rolls.push pins
  end
  def score
    total = 0
    frame_index = 0
    10.times do
      remaining_rolls = @rolls.drop(frame_index)
      if strike_at? remaining_rolls
        skip = 1
        bonus = 2
      elsif spare_at? remaining_rolls
        skip = 2
        bonus = 1
      else
        skip = 2
        bonus = 0
      end
      total += sum(remaining_rolls, skip + bonus)
      frame_index += skip
    end
    total
  end
  def strike_at?(rolls)
    sum(rolls, 1) == 10
  end
  def spare_at?(rolls)
    sum(rolls, 2) == 10
  end
  def sum(rolls, n)
    rolls.take(n).sum
  end
end
