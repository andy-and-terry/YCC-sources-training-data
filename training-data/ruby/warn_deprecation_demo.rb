require "stringio"

def capture_stderr
  old = $stderr
  $stderr = StringIO.new
  yield
  $stderr.string
ensure
  $stderr = old
end

out = capture_stderr { warn "plain warning" }
puts out.inspect
puts capture_stderr { warn "a", "b" }.inspect
puts capture_stderr { warn }.inspect
puts capture_stderr { warn "custom", uplevel: 0 }.sub(/^.*?:\d+: /, "<loc>: ").inspect

module Old
  def self.legacy
    warn "legacy is deprecated, use modern", category: :deprecated
    :ok
  end
end
Warning[:deprecated] = true
puts capture_stderr { Old.legacy }.inspect
puts Warning[:deprecated], Warning.respond_to?(:warn)

$VERBOSE = nil
puts capture_stderr { warn "silenced under -W0" }.inspect
