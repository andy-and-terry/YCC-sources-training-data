library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Handshake_Producer_Consumer is
    Port ( clk, rst_n, valid_in : in  STD_LOGIC;
           ready_out             : out STD_LOGIC;
           data_in               : in  STD_LOGIC_VECTOR(7 downto 0);
           data_out              : out STD_LOGIC_VECTOR(7 downto 0);
           data_valid            : out STD_LOGIC);
end Handshake_Producer_Consumer;

architecture Behavioral of Handshake_Producer_Consumer is
    signal data_out_internal : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_valid_internal : STD_LOGIC := '0';
begin
    ready_out <= '1';

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            data_out_internal <= (others => '0');
            data_valid_internal <= '0';
        elsif rising_edge(clk) then
            if valid_in = '1' then
                data_out_internal <= data_in;
                data_valid_internal <= '1';
            else
                data_valid_internal <= '0';
            end if;
        end if;
    end process;
    data_out <= data_out_internal;
    data_valid <= data_valid_internal;
end Behavioral;
