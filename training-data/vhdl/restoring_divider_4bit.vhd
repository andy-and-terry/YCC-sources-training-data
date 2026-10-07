library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Restoring_Divider_4bit is
    Port ( dividend : in  STD_LOGIC_VECTOR(3 downto 0);
           divisor  : in  STD_LOGIC_VECTOR(3 downto 0);
           quotient : out STD_LOGIC_VECTOR(3 downto 0);
           remainder: out STD_LOGIC_VECTOR(3 downto 0));
end Restoring_Divider_4bit;

architecture Behavioral of Restoring_Divider_4bit is
begin
    process(dividend, divisor)
        variable rem_reg : unsigned(4 downto 0);
        variable quo_reg : STD_LOGIC_VECTOR(3 downto 0);
        variable div_ext : unsigned(4 downto 0);
        variable trial    : unsigned(4 downto 0);
    begin
        rem_reg := (others => '0');
        quo_reg := dividend;
        div_ext := unsigned('0' & divisor);

        for i in 0 to 3 loop
            rem_reg := rem_reg(3 downto 0) & quo_reg(3);
            quo_reg := quo_reg(2 downto 0) & '0';

            if rem_reg >= div_ext then
                rem_reg := rem_reg - div_ext;
                quo_reg(0) := '1';
            end if;
        end loop;

        quotient  <= quo_reg;
        remainder <= std_logic_vector(rem_reg(3 downto 0));
    end process;
end Behavioral;
