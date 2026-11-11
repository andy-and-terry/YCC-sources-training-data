-- Narayana's cows N(n)=N(n-1)+N(n-3)
entity NarayanaCows_tb is
end entity;

architecture sim of NarayanaCows_tb is
    type vec is array (0 to 9) of integer;
begin
    process
        variable v : vec := (1, 1, 1, others => 0);
    begin
        for i in 3 to 9 loop
            v(i) := v(i - 1) + v(i - 3);
        end loop;
        for i in v'range loop
            report integer'image(v(i));
        end loop;
        wait;
    end process;
end architecture;
