require 'flipper'
require 'flipper/adapters/redis'

Flipper.configure do |config|
  config.default do
    adapter_arguments = []
    adapter_class_name = Rails.env.test? ? 'Memory' : 'Redis'

    if adapter_class_name == 'Redis'
      redis_client = Redis.new
      adapter_arguments << redis_client
    end

    adapter_class = "Flipper::Adapters::#{adapter_class_name}".safe_constantize
    adapter = adapter_class.new *adapter_arguments

    # pass adapter to handy DSL instance
    Flipper.new(adapter)
  end
end

Flipper::UI.configure do |config|
  config.fun = false
end
