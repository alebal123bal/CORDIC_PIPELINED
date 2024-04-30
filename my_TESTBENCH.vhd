library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity my_tb is
end entity my_tb;

architecture BHV of my_tb is
    component CORDIC_PIPE is
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
    end component CORDIC_PIPE;


	constant test_angle_0: real := 22.0 / 256.0;
	constant test_angle_1: real := 37.0 / 256.0;
	constant test_angle_2: real := 45.0 / 256.0;
	constant test_angle_3: real := 63.0 / 256.0;
	constant NORM: real := 2.0;

	--Test signals 
	signal x_s, y_s, z_s	:	signed(15 downto 0);
	signal xo_s, yo_s, zo_s	:	signed(15 downto 0);
	signal start_s			:	std_logic;
	signal clk_s			:	std_logic;

    begin
        process begin
		--Predivide the input by a division of 2 otherwise 1.0 is not reppable by S0.15
        start_s <= '1';
        
		x_s	<=	to_signed(integer((1.0 / NORM) * 2.0**15), 16);
		y_s	<=	(others => '0');
		z_s	<=	to_signed(integer((test_angle_0 / NORM) * 2.0**15), 16);
        wait for 10ns;  --1 CLK period
		
		z_s	<=	to_signed(integer((test_angle_1 / NORM) * 2.0**15), 16);
        wait for 10ns;  --1 CLK period
        
		z_s	<=	to_signed(integer((test_angle_2 / NORM) * 2.0**15), 16);
        wait for 10ns;  --1 CLK period
        
		z_s	<=	to_signed(integer((test_angle_3 / NORM) * 2.0**15), 16);
        wait for 10ns;  --1 CLK period

		wait for 290ns;
		std.env.stop(0);

		end process;


		CLOCK_GEN: process begin
			while true loop
			clk_s	<=	'0';
			wait for 5ns;
			clk_s	<=	'1';
			wait for 5ns;
			end loop;
		end process;
        
        DUT:    CORDIC_PIPE port map(
            xi => x_s,
            yi => y_s,
            zi => z_s,
            START => start_s,
            CLK => clk_s,
            xo => xo_s,
            yo => yo_s,
            zo => zo_s
        );
        
end architecture BHV;