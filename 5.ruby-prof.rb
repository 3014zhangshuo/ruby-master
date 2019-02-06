require 'ruby-prof'
PROF_ENV = :test
def prof_test
  if PROF_ENV == :test
    RubyProf.start
    yield
    result = RubyProf.stop
    printer = RubyProf::GraphPrinter.new(result)
    printer.print(STDOUT, {})
  else
    yield
  end
end

def controller_method
  prof_test do
    100_000.times {}
  end
end

controller_method

def hi
  100_000.times {}
end

def hello
  10_000.times {}
end

RubyProf.start

hi
hello

result = RubyProf.stop
printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})
