entity prefix_range_sum is
end entity;

architecture sim of prefix_range_sum is
  type int_array is array (natural range <>) of integer;
  constant values : int_array(0 to 7) := (3, 1, 4, 1, 5, 9, 2, 6);
begin
  process
    variable prefix : int_array(0 to 8) := (others => 0);
  begin
    for i in values'range loop
      prefix(i + 1) := prefix(i) + values(i);
    end loop;
    report "sum[2,5) = " & integer'image(prefix(5) - prefix(2));
    wait;
  end process;
end architecture;
