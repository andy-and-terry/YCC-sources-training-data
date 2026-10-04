alias Json = Nil | Bool | Int32 | String | Array(Json) | Hash(String, Json)
alias Callback = Int32 -> Int32

def render(value : Json) : String
  case value
  when Nil    then "null"
  when Bool   then value.to_s
  when Int32  then value.to_s
  when String then value.inspect
  when Array  then "[" + value.map { |v| render(v) }.join(",") + "]"
  when Hash   then "{" + value.map { |k, v| "#{k.inspect}:#{render(v)}" }.join(",") + "}"
  else             ""
  end
end

data = {"a" => 1, "b" => [true, nil, "x"]} of String => Json
puts render(data)

double : Callback = ->(x : Int32) { x * 2 }
puts double.call(21)
