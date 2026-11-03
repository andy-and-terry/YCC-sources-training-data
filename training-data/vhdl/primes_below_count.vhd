entity primes_below_count is
end entity;

architecture sim of primes_below_count is
begin
  process
    type flag_array is array (0 to 99) of boolean;
    variable composite : flag_array := (others => false);
    variable count     : natural := 0;
    variable j         : natural;
  begin
    for i in 2 to 99 loop
      if not composite(i) then
        count := count + 1;
        j := i * i;
        while j <= 99 loop
          composite(j) := true;
          j := j + i;
        end loop;
      end if;
    end loop;
    report "primes below 100: " & integer'image(count);
    wait;
  end process;
end architecture;
