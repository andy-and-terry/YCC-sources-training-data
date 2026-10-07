library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity function_procedure_demo is
    Port ( a, b      : in  unsigned(7 downto 0);
           max_val   : out unsigned(7 downto 0);
           ones_in_a : out unsigned(3 downto 0));
end function_procedure_demo;

architecture Behavioral of function_procedure_demo is
    -- Function: returns a single value
    function max2(x, y : unsigned) return unsigned is
    begin
        if x > y then
            return x;
        else
            return y;
        end if;
    end function;

    -- Procedure: may have several output parameters
    procedure count_ones(v : in unsigned(7 downto 0);
                         cnt : out unsigned(3 downto 0)) is
        variable c : unsigned(3 downto 0) := (others => '0');
    begin
        for i in v'range loop
            if v(i) = '1' then
                c := c + 1;
            end if;
        end loop;
        cnt := c;
    end procedure;
begin
    max_val <= max2(a, b);

    process(a)
        variable n : unsigned(3 downto 0);
    begin
        count_ones(a, n);
        ones_in_a <= n;
    end process;
end Behavioral;
