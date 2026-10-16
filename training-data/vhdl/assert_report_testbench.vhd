library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Self-checking testbench using assert/report severity levels.
entity Assert_Report_Testbench is
end Assert_Report_Testbench;

architecture Sim of Assert_Report_Testbench is
    signal a, b, s, c : STD_LOGIC := '0';
begin
    s <= a xor b;
    c <= a and b;

    stim : process
        type vec_t is array (0 to 3) of STD_LOGIC_VECTOR(1 downto 0);
        constant vecs : vec_t := ("00", "01", "10", "11");
    begin
        for i in vec_t'range loop
            a <= vecs(i)(1);
            b <= vecs(i)(0);
            wait for 10 ns;
            assert s = (vecs(i)(1) xor vecs(i)(0))
                report "Sum mismatch at vector " & integer'image(i)
                severity error;
            assert c = (vecs(i)(1) and vecs(i)(0))
                report "Carry mismatch at vector " & integer'image(i)
                severity error;
        end loop;
        report "Half adder test complete" severity note;
        wait;
    end process;
end Sim;
