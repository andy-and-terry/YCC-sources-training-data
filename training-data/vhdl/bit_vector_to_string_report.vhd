library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Converts a std_logic_vector to a string for reports (no external packages).
entity Slv_To_String_Demo is
end Slv_To_String_Demo;

architecture Sim of Slv_To_String_Demo is
    function to_str(v : STD_LOGIC_VECTOR) return string is
        variable s : string(1 to v'length);
        variable k : positive := 1;
    begin
        for i in v'range loop
            s(k) := STD_LOGIC'image(v(i))(2);
            k := k + 1;
        end loop;
        return s;
    end function;
begin
    process
        variable w : STD_LOGIC_VECTOR(7 downto 0) := "10100101";
    begin
        report "value = " & to_str(w);
        w := not w;
        report "inverted = " & to_str(w);
        wait;
    end process;
end Sim;
