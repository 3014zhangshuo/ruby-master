a = [1,2,4]
a.map { |x| x*2 }
a.map(&:to_s)

begin
  'to_s'.to_proc
rescue NoMethodError => e
  puts e.message
end

:to_s.to_proc # => proc
proc {}.to_proc # => proc

class Symbol
  def to_proc
    proc { |x| x.send(self) }
  end
end

b = [1,2,4]
p b.map(&:to_s)

class ProcStrore
  def initialize handler
    @handler = handler
  end

  def to_proc
    proc { |ele| send(@handler, ele) }
  end

  def hi ele
    "hi #{ele}"
  end

  def hello ele
    "hello #{ele}"
  end
end

p b.map(&ProcStrore.new(:hi))
