library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;

entity Simple_ALU_Testbench is
end Simple_ALU_Testbench;

architecture Behavioral of Simple_ALU_Testbench is
    component ALU_4bit is
        Port ( a, b   : in  STD_LOGIC_VECTOR(3 downto 0);
               op     : in  STD_LOGIC_VECTOR(2 downto 0);
               result : out STD_LOGIC_VECTOR(3 downto 0);
               zero   : out STD_LOGIC);
    end component;

    signal a, b : STD_LOGIC_VECTOR(3 downto 0);
    signal op : STD_LOGIC_VECTOR(2 downto 0);
    signal result : STD_LOGIC_VECTOR(3 downto 0);
    signal zero : STD_LOGIC;
begin
    dut: ALU_4bit port map (a, b, op, result, zero);

    process
    begin
        a <= "0101"; b <= "0011"; op <= "000";
        wait for 10 ns;
        op <= "001";
        wait for 10 ns;
        wait;
    end process;
end Behavioral;
