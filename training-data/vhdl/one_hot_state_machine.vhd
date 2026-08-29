library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity One_Hot_State_Machine is
    Port ( clk, rst_n, go : in  STD_LOGIC;
           state           : out STD_LOGIC_VECTOR(3 downto 0);
           done            : out STD_LOGIC);
end One_Hot_State_Machine;

architecture Behavioral of One_Hot_State_Machine is
    constant IDLE   : STD_LOGIC_VECTOR(3 downto 0) := "0001";
    constant RUN    : STD_LOGIC_VECTOR(3 downto 0) := "0010";
    constant WAIT_S : STD_LOGIC_VECTOR(3 downto 0) := "0100";
    constant FINISH : STD_LOGIC_VECTOR(3 downto 0) := "1000";
    signal state_internal : STD_LOGIC_VECTOR(3 downto 0) := IDLE;
begin
    done <= state_internal(3);

    process(clk, rst_n)
    begin
        if rst_n = '0' then
            state_internal <= IDLE;
        elsif rising_edge(clk) then
            case state_internal is
                when IDLE =>
                    if go = '1' then state_internal <= RUN; end if;
                when RUN => state_internal <= WAIT_S;
                when WAIT_S => state_internal <= FINISH;
                when FINISH => state_internal <= IDLE;
                when others => state_internal <= IDLE;
            end case;
        end if;
    end process;
    state <= state_internal;
end Behavioral;
