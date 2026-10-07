library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Binary_Divider is
    Generic ( WIDTH : integer := 8 );
    Port ( dividend    : in  UNSIGNED(WIDTH-1 downto 0);
           divisor     : in  UNSIGNED(3 downto 0);
           quotient    : out UNSIGNED(WIDTH-1 downto 0);
           remainder   : out UNSIGNED(3 downto 0);
           div_by_zero : out STD_LOGIC);
end Binary_Divider;

architecture Behavioral of Binary_Divider is
begin
    div_by_zero <= '1' when divisor = 0 else '0';

    process(dividend, divisor)
        variable rem_var : UNSIGNED(3 downto 0);
        variable quo_var : UNSIGNED(WIDTH-1 downto 0);
    begin
        rem_var := (others => '0');
        quo_var := (others => '0');
        if divisor /= 0 then
            for i in WIDTH-1 downto 0 loop
                rem_var := rem_var(2 downto 0) & dividend(i);
                if rem_var >= divisor then
                    rem_var := rem_var - divisor;
                    quo_var(i) := '1';
                else
                    quo_var(i) := '0';
                end if;
            end loop;
        end if;
        quotient <= quo_var;
        remainder <= rem_var;
    end process;
end Behavioral;
