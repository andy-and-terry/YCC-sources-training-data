-- Perrin sequence P(n)=P(n-2)+P(n-3)
entity PerrinSequence_tb is
end entity;

architecture sim of PerrinSequence_tb is
    type vec is array (0 to 9) of integer;
begin
    process
        variable v : vec := (3, 0, 2, others => 0);
    begin
        for i in 3 to 9 loop
            v(i) := v(i - 2) + v(i - 3);
        end loop;
        for i in v'range loop
            report integer'image(v(i));
        end loop;
        wait;
    end process;
end architecture;
