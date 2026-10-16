require "ostruct"

cfg = OpenStruct.new(host: "localhost", port: 80)
cfg.debug = true
cfg[:timeout] = 30
puts cfg.host, cfg.port, cfg.debug, cfg.timeout
puts cfg.missing.inspect
puts cfg.respond_to?(:host), cfg.to_h.inspect
cfg.delete_field(:debug)
puts cfg.debug.inspect
puts cfg.dig(:host)
puts cfg == OpenStruct.new(host: "localhost", port: 80, timeout: 30)
cfg.each_pair { |k, v| puts "#{k}=#{v}" }
puts cfg.inspect
