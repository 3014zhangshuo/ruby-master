# $" ruby 内存中已经加载的文件
def reload(gem)
  $".grep(Regexp.new(gem)).each { |file| load file }
end
