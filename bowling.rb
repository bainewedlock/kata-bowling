class Bowling
  def initialize
    @rolls = []
  end
  def roll(pins)
    @rolls.push pins
  end
  def score
    @frame_index = 0
    @total = 0
    10.times do
      calc_frame
    end
    @total
  end
  def calc_frame
    if strike?
      rolls_in_frame = 1
      bonus_rolls = 2
    elsif spare?
      rolls_in_frame = 2
      bonus_rolls = 1
    else
      rolls_in_frame = 2
      bonus_rolls = 0
    end
    @total += sum_of_next(rolls_in_frame + bonus_rolls)
    @frame_index += rolls_in_frame
  end
  def strike?
    sum_of_next(1) == 10
  end
  def spare?
    sum_of_next(2) == 10
  end
  def sum_of_next(n)
    @rolls.drop(@frame_index).take(n).sum
  end
end
