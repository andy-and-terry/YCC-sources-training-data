entity tb_x2 is end entity;

architecture sim of tb_x2 is
  signal a, b, s : integer := 0;
begin
  s <= a + b;
  process begin
    a <= 2; b <= 3; wait for 10 ns;
    assert s = 5 report "adder failed" severity error;
    wait;
  end process;
end architecture;
