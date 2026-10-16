library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Concurrent conditional and selected signal assignments side by side.
entity Conditional_Assign_Demo is
    Port ( sel  : in  STD_LOGIC_VECTOR(1 downto 0);
           a, b, c, d : in STD_LOGIC;
           y_when   : out STD_LOGIC;
           y_select : out STD_LOGIC);
end Conditional_Assign_Demo;

architecture Dataflow of Conditional_Assign_Demo is
begin
    y_when <= a when sel = "00" else
              b when sel = "01" else
              c when sel = "10" else
              d;

    with sel select
        y_select <= a when "00",
                    b when "01",
                    c when "10",
                    d when others;
end Dataflow;
