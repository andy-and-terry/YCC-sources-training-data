package util is
  constant WIDTH : integer := 8;
  function max2 (a, b : integer) return integer;
end package;

package body util is
  function max2 (a, b : integer) return integer is
  begin
    if a > b then return a; else return b; end if;
  end function;
end package body;
