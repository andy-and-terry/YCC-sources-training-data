library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity checksum_accumulator is
    Port ( clk, rst_n : in  STD_LOGIC;
           clear, valid : in STD_LOGIC;
           byte_in  : in  STD_LOGIC_VECTOR(7 downto 0);
           checksum : out STD_LOGIC_VECTOR(7 downto 0));
end checksum_accumulator;

architecture Behavioral of checksum_accumulator is
    signal sum : unsigned(7 downto 0) := (others => '0');
begin
    -- Two's complement: data bytes plus checksum sum to zero
    checksum <= std_logic_vector(0 - sum);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            sum <= (others => '0');
        elsif rising_edge(clk) then
            if clear = '1' then
                sum <= (others => '0');
            elsif valid = '1' then
                sum <= sum + unsigned(byte_in);
            end if;
        end if;
    end process;
end Behavioral;
