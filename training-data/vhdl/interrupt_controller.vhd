library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Interrupt_Controller is
    Generic ( NUM_IRQS : integer := 4 );
    Port ( irq_in       : in  STD_LOGIC_VECTOR(NUM_IRQS-1 downto 0);
           irq_mask     : in  STD_LOGIC_VECTOR(NUM_IRQS-1 downto 0);
           irq_pending  : out STD_LOGIC;
           irq_vector   : out integer range 0 to NUM_IRQS-1);
end Interrupt_Controller;

architecture Behavioral of Interrupt_Controller is
    signal masked_irq : STD_LOGIC_VECTOR(NUM_IRQS-1 downto 0);
begin
    masked_irq <= irq_in and not irq_mask;
    irq_pending <= '1' when masked_irq /= (masked_irq'range => '0') else '0';

    process(masked_irq)
    begin
        irq_vector <= 0;
        for i in 0 to NUM_IRQS-1 loop
            if masked_irq(i) = '1' then
                irq_vector <= i;
            end if;
        end loop;
    end process;
end Behavioral;
