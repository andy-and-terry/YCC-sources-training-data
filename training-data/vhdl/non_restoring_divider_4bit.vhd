library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Non_Restoring_Divider_4bit is
    Port ( dividend : in  STD_LOGIC_VECTOR(3 downto 0);
           divisor  : in  STD_LOGIC_VECTOR(3 downto 0);
           quotient : out STD_LOGIC_VECTOR(3 downto 0);
           remainder: out STD_LOGIC_VECTOR(3 downto 0));
end Non_Restoring_Divider_4bit;

architecture Behavioral of Non_Restoring_Divider_4bit is
begin
    process(dividend, divisor)
        variable rem_reg : signed(4 downto 0);
        variable quo_reg : STD_LOGIC_VECTOR(3 downto 0);
        variable div_ext : signed(4 downto 0);
    begin
        rem_reg := (others => '0');
        quo_reg := dividend;
        div_ext := signed('0' & divisor);

        for i in 0 to 3 loop
            rem_reg := rem_reg(3 downto 0) & quo_reg(3);
            quo_reg := quo_reg(2 downto 0) & '0';

            if rem_reg(4) = '0' then
                rem_reg := rem_reg - div_ext;
            else
                rem_reg := rem_reg + div_ext;
            end if;

            if rem_reg(4) = '0' then
                quo_reg(0) := '1';
            else
                quo_reg(0) := '0';
            end if;
        end loop;

        if rem_reg(4) = '1' then
            rem_reg := rem_reg + div_ext;
        end if;

        quotient  <= quo_reg;
        remainder <= std_logic_vector(rem_reg(3 downto 0));
    end process;
end Behavioral;
