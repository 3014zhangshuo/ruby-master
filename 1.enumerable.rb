class DataModel
  include Enumerable

  def initialize data
    @data = data
  end

  def each
    @data.each { |x| yield x }
  end
end

data = DataModel.new([2,3,4])
p data.select { |x| x > 3 }
p data.any? { |x| x > 3 }
data.cycle(2) { |x| p x }

# (1..Float::INFINITY).select { |x| x % 27 == 0 }.take(10)
# Lazy Load
p (1..Float::INFINITY).lazy.select { |x| x % 27 == 0 }.take(10).to_a

file = File.open('file.log', 'r')
p file.each_line.lazy.select { |x| x=~ /error/ }.to_a
