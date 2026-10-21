-- Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
entity jacobsthal_numbers is
end entity;

architecture sim of jacobsthal_numbers is
begin
  process
    variable a : integer := 0;
    variable b : integer := 1;
    variable t : integer;
  begin
    for i in 0 to 14 loop
      report "J(" & integer'image(i) & ") = " & integer'image(a);
      t := b + 2 * a;
      a := b;
      b := t;
    end loop;
    wait;
  end process;
end architecture;
