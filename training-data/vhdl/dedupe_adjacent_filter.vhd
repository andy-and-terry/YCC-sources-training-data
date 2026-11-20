library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Emit a byte only when it differs from the previous byte.
entity Dedupe_Adjacent_Filter is
    Port ( clk, rst, in_valid : in STD_LOGIC;
           in_data  : in  STD_LOGIC_VECTOR(7 downto 0);
           out_valid : out STD_LOGIC;
           out_data : out STD_LOGIC_VECTOR(7 downto 0));
end Dedupe_Adjacent_Filter;

architecture Behavioral of Dedupe_Adjacent_Filter is
    signal prev : STD_LOGIC_VECTOR(7 downto 0);
    signal have_prev : STD_LOGIC := '0';
begin
    process (clk)
    begin
        if rising_edge(clk) then
            out_valid <= '0';
            if rst = '1' then
                have_prev <= '0';
            elsif in_valid = '1' then
                if have_prev = '0' or in_data /= prev then
                    out_valid <= '1';
                    out_data <= in_data;
                end if;
                prev <= in_data;
                have_prev <= '1';
            end if;
        end if;
    end process;
end Behavioral;
