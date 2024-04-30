library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CU is
    port(
        START   :   in std_logic;
        CLK     :   in std_logic;
        EN      :   out std_logic
    );
end entity CU;

architecture BHV of CU is
    signal start_i  :   std_logic;

    begin
        EN_PROC: process(START)
        begin
            start_i <= START;
        end process EN_PROC;

        ASSIGN_OUT: process(CLK)
        begin
            if rising_edge(CLK) then
                EN  <= start_i;
            end if;
        end process ASSIGN_OUT;

end architecture BHV;


