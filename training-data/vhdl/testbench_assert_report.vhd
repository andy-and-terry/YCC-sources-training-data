entity tb is end entity;

architecture sim of tb is
  signal a, b, y : integer;
begin
  y <= a + b;
  process begin
    a <= 2; b <= 3; wait for 10 ns;
    assert y = 5 report "sum mismatch" severity error;
    report "done";
    wait;
  end process;
end architecture;
