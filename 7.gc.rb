# 控制 ruby 虚拟机初次启用使用内存大小
# export RUBY_GC_HEAP_INIT_SLOTS=10000
p system('export RUBY_GC_HEAP_INIT_SLOTS=100000')
p system('echo RUBY_GC_HEAP_INIT_SLOTS')

p GC.stat

p GC.stat[:heap_live_slots]
GC.start
p GC.stat[:heap_live_slots]

# RUBY_GC_HEAP_INIT_SLOTS default 4096

class GCstat
  def initialize app
    @app = app
  end

  def call env
    start = GC.stat[:heap_live_slots]
    Rails.logger.info "GC before: #{start}"
    status, header, response = @app.call(env)
    Rails.logger.info "GC after: #{GC.stat[:heap_live_slots]}, growth: #{GC.stat[:heap_live_slots] - start}"
    [status, header, response]
  end
end

# set config/application.rb
# config.middleware.insert_before "Rack::Sendfile", "GCstat"
