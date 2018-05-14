class Bowling
  def initialize
    @rolls = []
  end
  def roll(pins)
    @rolls.push pins
  end
  def score
    calc_frames @rolls, 10
  end

  private

  def calc_frames(rolls, remaining_frames)
    return 0 if remaining_frames == 0

    if strike_at? rolls
      skip = 1
      bonus = 2
    elsif spare_at? rolls
      skip = 2
      bonus = 1
    else
      skip = 2
      bonus = 0
    end
    sum(rolls, skip + bonus) +
      calc_frames(rolls.drop(skip), remaining_frames-1)
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
