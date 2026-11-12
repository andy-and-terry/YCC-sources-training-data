entity tb is end;
architecture sim of tb is signal a, b, y : bit;
begin
  y <= a and b;
  process begin
    a <= '1'; b <= '1'; wait for 10 ns;
    assert y = '1' report "and failed" severity error;
    wait;
  end process;
end;
