library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package pack_ROM is
    type long_array is array(0 to 15) of signed(15 downto 0);
    type gen_sig_array is array(0 to 16) of signed(15 downto 0);    --Internal backbone signal for the for-generate
end package pack_ROM;
