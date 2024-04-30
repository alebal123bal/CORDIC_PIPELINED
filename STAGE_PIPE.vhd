library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

-- Single stage for the pipelined CORDIC architecture
-- To be used with the for generate loop.

entity STAGE_PIPE is
    generic(
        idx   :   integer
    );
    port(
        xi  :   in signed(15 downto 0);
        yi  :   in signed(15 downto 0);
        zi  :   in signed(15 downto 0);
        ROM_I   :    in signed(15 downto 0);
        CLK :   in std_logic;
        xo  :   out signed(15 downto 0);
        yo  :   out signed(15 downto 0);
        zo  :   out signed(15 downto 0)
        );
end entity;

architecture BHV of STAGE_PIPE is
    --  Output of mux internal sig to be assigned to REG
    signal xm, ym, zm   :   signed(15 downto 0);

    begin
        SHIFT_ADD: process(xi, yi, zi) begin
            if  zi(zi'left) = '0' then
                xm  <=  xi - shift_right(yi, idx);
                ym  <=  yi + shift_right(xi, idx);
                zm  <=  zi - ROM_I;
            else
                xm  <=  xi + shift_right(yi, idx);
                ym  <=  yi - shift_right(xi, idx);
                zm  <=  zi + ROM_I;
            end if;
        end process SHIFT_ADD;

        ASSIGN_REG: process(CLK) begin
            if rising_edge(CLK) then
                xo  <=  xm;
                yo  <=  ym;
                zo  <=  zm;
            end if;
        end process ASSIGN_REG;

end BHV;