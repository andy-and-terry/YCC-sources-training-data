ExUnit.start(autorun: false)

defmodule MathTest do
  use ExUnit.Case

  test "addition" do
    assert 1 + 1 == 2
    refute 1 + 1 == 3
  end

  test "pattern assert" do
    assert {:ok, n} = {:ok, 42}
    assert n > 40
  end

  test "raises" do
    assert_raise ArithmeticError, fn -> 1 / 0 end
  end
end

ExUnit.run()
