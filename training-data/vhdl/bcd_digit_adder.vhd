library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- adds two BCD digits plus carry-in, producing a BCD digit and carry-out
entity bcd_digit_adder is
    port (
        a, b  : in  unsigned(3 downto 0);
        cin   : in  std_logic;
        sum   : out unsigned(3 downto 0);
        cout  : out std_logic
    );
end entity;

architecture rtl of bcd_digit_adder is
begin
    process (a, b, cin)
        variable t : unsigned(4 downto 0);
    begin
        t := ('0' & a) + ('0' & b);
        if cin = '1' then
            t := t + 1;
        end if;
        if t > 9 then
            t := t + 6;     -- decimal correction
            cout <= '1';
        else
            cout <= '0';
        end if;
        sum <= t(3 downto 0);
    end process;
end architecture;
