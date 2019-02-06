class A
  def hi
    puts 'hi'
  end
end

p A.ancestors
p A.superclass

A.new.hi
puts A.instance_methods.size

# prue class enviroment
class B < BasicObject
end

p B.ancestors
