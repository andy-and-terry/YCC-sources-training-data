library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity record_type_demo is
    Port ( clk, rst_n : in  STD_LOGIC;
           pkt_valid  : in  STD_LOGIC;
           pkt_addr   : in  unsigned(7 downto 0);
           pkt_data   : in  unsigned(7 downto 0);
           last_addr  : out unsigned(7 downto 0);
           last_data  : out unsigned(7 downto 0);
           count      : out unsigned(7 downto 0));
end record_type_demo;

architecture Behavioral of record_type_demo is
    type packet_t is record
        addr  : unsigned(7 downto 0);
        data  : unsigned(7 downto 0);
        count : unsigned(7 downto 0);
    end record;

    constant EMPTY : packet_t := (addr => (others => '0'),
                                  data => (others => '0'),
                                  count => (others => '0'));
    signal last_pkt : packet_t := EMPTY;
begin
    last_addr <= last_pkt.addr;
    last_data <= last_pkt.data;
    count     <= last_pkt.count;

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            last_pkt <= EMPTY;
        elsif rising_edge(clk) then
            if pkt_valid = '1' then
                last_pkt.addr  <= pkt_addr;
                last_pkt.data  <= pkt_data;
                last_pkt.count <= last_pkt.count + 1;
            end if;
        end if;
    end process;
end Behavioral;
