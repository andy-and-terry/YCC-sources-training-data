def handle(msg)
  case msg
  in { type: "add", args: [Integer => a, Integer => b] } then a + b
  in { type: "neg", args: [Integer => a] } then -a
  in { type: } then "unknown #{type}"
  end
end
p handle({ type: "add", args: [1, 2] }), handle({ type: "neg", args: [5] }), handle({ type: "zzz" })
