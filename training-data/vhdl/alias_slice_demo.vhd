library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Decodes an instruction word with aliases for its fields.
entity Alias_Slice_Demo is
    Port ( instr  : in  STD_LOGIC_VECTOR(15 downto 0);
           opcode : out STD_LOGIC_VECTOR(3 downto 0);
           rd, rs : out STD_LOGIC_VECTOR(3 downto 0);
           imm    : out STD_LOGIC_VECTOR(3 downto 0));
end Alias_Slice_Demo;

architecture Dataflow of Alias_Slice_Demo is
    alias f_op  : STD_LOGIC_VECTOR(3 downto 0) is instr(15 downto 12);
    alias f_rd  : STD_LOGIC_VECTOR(3 downto 0) is instr(11 downto 8);
    alias f_rs  : STD_LOGIC_VECTOR(3 downto 0) is instr(7 downto 4);
    alias f_imm : STD_LOGIC_VECTOR(3 downto 0) is instr(3 downto 0);
begin
    opcode <= f_op;
    rd     <= f_rd;
    rs     <= f_rs;
    imm    <= f_imm;
end Dataflow;
