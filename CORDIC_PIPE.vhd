library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CORDIC_PIPE is
    port(
        xi  :   in signed(15 downto 0);
        yi  :   in signed(15 downto 0);
        zi  :   in signed(15 downto 0);
        START  :   in std_logic;
        CLK :   in std_logic;
        xo  :   out signed(15 downto 0);
        yo  :   out signed(15 downto 0);
        zo  :   out signed(15 downto 0)
    );
end entity CORDIC_PIPE;

architecture STRUCT of CORDIC_PIPE is
    component ALU_PIPE is
        port(
            xi  :   in signed(15 downto 0);
            yi  :   in signed(15 downto 0);
            zi  :   in signed(15 downto 0);
            EN  :   in std_logic;
            CLK :   in std_logic;
            xo  :   out signed(15 downto 0);
            yo  :   out signed(15 downto 0);
            zo  :   out signed(15 downto 0)
        );
    end component ALU_PIPE;

    component CU is
        port(
            START   :   in std_logic;
            CLK     :   in std_logic;
            EN      :   out std_logic
        );
    end component CU;

    signal EN_s: std_logic;

    begin
        my_CU: CU port map(START => START, CLK => CLK, EN => EN_s);
        my_ALU: ALU_PIPE port map(
            xi => xi,
            yi => yi,
            zi => zi,
            EN => EN_s,
            CLK => CLK,
            xo => xo,
            yo => yo,
            zo => zo
        );


end architecture STRUCT;