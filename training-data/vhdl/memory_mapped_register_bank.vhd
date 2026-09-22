library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory_Mapped_Register_Bank is
    Port ( clk, rst_n     : in  STD_LOGIC;
           wr_en, rd_en   : in  STD_LOGIC;
           addr           : in  STD_LOGIC_VECTOR(1 downto 0);
           wr_data        : in  STD_LOGIC_VECTOR(7 downto 0);
           rd_data        : out STD_LOGIC_VECTOR(7 downto 0));
end Memory_Mapped_Register_Bank;

architecture Behavioral of Memory_Mapped_Register_Bank is
    constant ADDR_CTRL   : STD_LOGIC_VECTOR(1 downto 0) := "00";
    constant ADDR_STATUS : STD_LOGIC_VECTOR(1 downto 0) := "01";
    constant ADDR_DATA   : STD_LOGIC_VECTOR(1 downto 0) := "10";

    signal ctrl_reg     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal data_reg     : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal status_count : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    process(clk, rst_n)
    begin
        if rst_n = '0' then
            ctrl_reg     <= (others => '0');
            data_reg     <= (others => '0');
            status_count <= (others => '0');
        elsif rising_edge(clk) then
            status_count <= std_logic_vector(unsigned(status_count) + 1);
            if wr_en = '1' then
                case addr is
                    when ADDR_CTRL => ctrl_reg <= wr_data;
                    when ADDR_DATA => data_reg <= wr_data;
                    when others    => null;
                end case;
            end if;
        end if;
    end process;

    process(rd_en, addr, ctrl_reg, status_count, data_reg)
    begin
        if rd_en = '1' then
            case addr is
                when ADDR_CTRL   => rd_data <= ctrl_reg;
                when ADDR_STATUS => rd_data <= status_count;
                when ADDR_DATA   => rd_data <= data_reg;
                when others      => rd_data <= (others => '0');
            end case;
        else
            rd_data <= (others => '0');
        end if;
    end process;
end Behavioral;
