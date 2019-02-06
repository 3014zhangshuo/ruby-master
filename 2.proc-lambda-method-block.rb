require 'benchmark'

a = proc { |x| p x }
a.call(2)
a.call

b = lambda { |x| p x }
b.call(3)
begin
  b.call # => error lambda check arguments
rescue ArgumentError => e
  puts e.message
end

# proc 会改变上下文解释顺序
def hi
  a = proc { return 3 }
  a.call
  4
end

p hi

# lambda 可以当做普通的方法函数
def hello
  b = lambda { return 5 }
  b.call
  6
end

p hello

# method 把方法转换成代码块
p method(:hi).call

# binding返回当前整个作用域的上下文
def binding_method
  y = 10
  binding
end

m = binding_method
p m.eval('y')

def declare_block &block
  block.call
end

p Benchmark.realtime { 1_000_000.times { declare_block { 9 } } }

def anonymous_block
  yield
end

p Benchmark.realtime { 1_000_000.times { anonymous_block { 9 } } }
