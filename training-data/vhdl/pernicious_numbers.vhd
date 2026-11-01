-- Pernicious numbers: the popcount is prime.
library ieee;
use ieee.numeric_std.all;

entity pernicious_numbers is
end entity;

architecture sim of pernicious_numbers is
    function popcount(n : natural) return natural is
        variable v : unsigned(7 downto 0) := to_unsigned(n, 8);
        variable c : natural := 0;
    begin
        for i in v'range loop
            if v(i) = '1' then
                c := c + 1;
            end if;
        end loop;
        return c;
    end function;

    function is_prime(k : natural) return boolean is
    begin
        if k < 2 then
            return false;
        end if;
        for d in 2 to k - 1 loop
            exit when d * d > k;
            if k mod d = 0 then
                return false;
            end if;
        end loop;
        return true;
    end function;
begin
    process
    begin
        for n in 1 to 20 loop
            if is_prime(popcount(n)) then
                report "pernicious: " & integer'image(n);
            end if;
        end loop;
        wait;
    end process;
end architecture;
