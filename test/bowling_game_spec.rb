require 'rspec'

def points(line)
  result = 0
  line.chars.to_a.each_index do | index |
    if line[index] == '-'
      result += 0
    elsif line[index] == '/'
      result += 10 + line[index + 1].ord - 48
    elsif line[index] == 'X'
      result += 10 + line[index + 1].ord - 48 + line[index + 2].ord - 48
    else
      result += line[index].ord - 48
    end
  end
  result
end

describe 'BowlingGameShould' do

  it 'should return zero points when no drawn in a bowling line' do
    expect(points('---------------------')).to(eq(0))
  end

  it 'should return 1 points when the first bowl is the only drawn in a bowling line' do
    expect(points('1--------------------')).to(eq(1))
  end

  it 'should return 4 points when in the bowling line is more than one drawn bowl' do
    expect(points('1---3----------------')).to(eq(4))
  end

  it 'should add the next throw when the previous is an spare' do
    expect(points('1---/4---------------')).to(eq(19))
  end

  it 'should add the next two throws when the previous is an strike' do
    expect(points('1---X45--------------')).to(eq(29))
  end
end