p ObjectSpace.class
p ObjectSpace.each_object.to_a.size
p ObjectSpace.each_object(String).to_a.size

class A
end

a = A.new

ObjectSpace.each_object(::A) do |object|
  object.instance_eval do
    def hello
      "hello #{self}"
    end
  end
end

p a.hello
begin
  p A.new.hello
rescue NoMethodError => e
  puts e.message
end

# ruby before 2.1 垃圾回收不会回收 symbol
p Symbol.all_symbols.size
10_000.times { |t| "t_#{t}".to_sym }
p Symbol.all_symbols.size
GC.start
p Symbol.all_symbols.size
