require 'rspec'
require_relative 'bowling'

describe Bowling do
  it 'should score 300 for 12 strikes' do
    b = Bowling.new
    12.times do 
      b.roll 10
    end
    expect(b.score).to eq 300
  end
  it 'should score 90 for 10 pairs of 8 and 1' do
    b = Bowling.new
    10.times do
      b.roll 8
      b.roll 1
    end
    expect(b.score).to eq 90
  end
  it 'should score 150 for 10 pairs of 5 and spare and a final 5' do
    b = Bowling.new
    10.times do
      b.roll 5
      b.roll 5
    end
    b.roll 5
    expect(b.score).to eq 150
  end
  it 'should calc strike bonus correctly' do
    b = Bowling.new
    b.roll 10
    b.roll 3
    b.roll 6
    expect(b.score).to eq 28
  end
  it 'http://rubyquiz.strd6.com/quizzes/181-bowling-scores' do
    b = Bowling.new
    '6 2 7 1 10 9 0 8 2 10 10 3 5 7 2 5 5 8'.split.each do |p|
      b.roll p.to_i
    end
    expect(b.score).to eq 140
  end
end
