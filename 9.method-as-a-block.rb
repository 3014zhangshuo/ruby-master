def hi(name)
  p "hi #{name}"
end

method(:hi) # lambda

method(:hi).call('zhangshuo')

def hi_back(v)
  v.call('zhangshuo')
end

hi_back(method(:hi))

def hi_back
  yield
end

hi_back { hi('zhangshuo') }
