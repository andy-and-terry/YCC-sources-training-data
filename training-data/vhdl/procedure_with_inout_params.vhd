library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench helper procedure with in, out and inout parameters.
entity Procedure_Params_Demo is
end Procedure_Params_Demo;

architecture Sim of Procedure_Params_Demo is
    procedure toggle_n(signal s : inout STD_LOGIC;
                       n        : in  natural;
                       period   : in  time;
                       variable done : out boolean) is
    begin
        for i in 1 to n loop
            s <= not s;
            wait for period;
        end loop;
        done := true;
    end procedure;

    signal line_sig : STD_LOGIC := '0';
begin
    process
        variable finished : boolean := false;
    begin
        toggle_n(line_sig, 6, 5 ns, finished);
        assert finished report "procedure did not finish" severity error;
        wait;
    end process;
end Sim;
