entity perfect_square_check is
end entity;

architecture sim of perfect_square_check is
  function is_square (n : natural) return boolean is
  begin
    for r in 0 to 16 loop
      if r * r = n then
        return true;
      end if;
    end loop;
    return false;
  end function;
begin
  process
  begin
    for n in 0 to 29 loop
      if is_square(n) then
        report integer'image(n);
      end if;
    end loop;
    wait;
  end process;
end architecture;
