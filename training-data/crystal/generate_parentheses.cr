def generate_parentheses(n : Int32) : Array(String)
  result = [] of String

  backtrack = uninitialized Proc(String, Int32, Int32, Nil)
  backtrack = ->(current : String, open : Int32, close : Int32) do
    if current.size == n * 2
      result << current
      next nil
    end
    backtrack.call(current + "(", open + 1, close) if open < n
    backtrack.call(current + ")", open, close + 1) if close < open
    nil
  end

  backtrack.call("", 0, 0)
  result
end

puts generate_parentheses(3).inspect
