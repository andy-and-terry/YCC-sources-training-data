entity list_mode is
end entity;

architecture sim of list_mode is
  type int_array is array (natural range <>) of integer;
  constant items : int_array(0 to 5) := (1, 2, 2, 3, 3, 4);
begin
  process
    variable counts : int_array(0 to 9) := (others => 0);
    variable top    : integer := 0;
  begin
    for i in items'range loop
      counts(items(i)) := counts(items(i)) + 1;
      if counts(items(i)) > top then
        top := counts(items(i));
      end if;
    end loop;
    for v in counts'range loop
      if counts(v) = top then
        report "mode: " & integer'image(v);
      end if;
    end loop;
    wait;
  end process;
end architecture;
