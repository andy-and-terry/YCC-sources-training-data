library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CDC_Handshake_Synchronizer is
    Port ( clk_src, rst_src_n, pulse_in  : in  STD_LOGIC;
           clk_dst, rst_dst_n            : in  STD_LOGIC;
           pulse_out                     : out STD_LOGIC);
end CDC_Handshake_Synchronizer;

architecture Behavioral of CDC_Handshake_Synchronizer is
    signal toggle_src : STD_LOGIC := '0';
    signal sync_dst    : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
begin
    process(clk_src, rst_src_n)
    begin
        if rst_src_n = '0' then
            toggle_src <= '0';
        elsif rising_edge(clk_src) then
            if pulse_in = '1' then
                toggle_src <= not toggle_src;
            end if;
        end if;
    end process;

    process(clk_dst, rst_dst_n)
    begin
        if rst_dst_n = '0' then
            sync_dst <= (others => '0');
        elsif rising_edge(clk_dst) then
            sync_dst <= sync_dst(1 downto 0) & toggle_src;
        end if;
    end process;

    pulse_out <= sync_dst(2) xor sync_dst(1);
end Behavioral;
