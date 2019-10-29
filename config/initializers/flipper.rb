require 'flipper'

Flipper.configure do |config|
  config.default do
    adapter_class_name = Rails.env.test? ? 'Memory' : 'Redis'
    adapter_class = "Flipper::Adapters::#{adapter_class_name}".safe_constantize
    adapter = adapter_class.new

    # pass adapter to handy DSL instance
    Flipper.new(adapter)
  end
end
