-- VHDL-2008 protected type used as a simulation-only counter.
entity Protected_Counter_Demo is
end Protected_Counter_Demo;

architecture Sim of Protected_Counter_Demo is
    type counter_t is protected
        procedure increment;
        impure function get return integer;
    end protected counter_t;

    type counter_t is protected body
        variable value : integer := 0;
        procedure increment is
        begin
            value := value + 1;
        end procedure;
        impure function get return integer is
        begin
            return value;
        end function;
    end protected body counter_t;

    shared variable hits : counter_t;
begin
    p1 : process
    begin
        for i in 1 to 3 loop
            hits.increment;
            wait for 10 ns;
        end loop;
        wait;
    end process;

    p2 : process
    begin
        wait for 50 ns;
        report "hits = " & integer'image(hits.get);
        wait;
    end process;
end Sim;
