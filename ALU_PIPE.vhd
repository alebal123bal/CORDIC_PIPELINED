library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.pack_ROM.all;

entity ALU_PIPE is
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
end entity ALU_PIPE;

architecture BHV of ALU_PIPE is 
    component ROM is
        port(
            content: out long_array
        );
    end component;
    
    component STAGE_PIPE is
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
    end component;

    signal ki   :   unsigned(3 downto 0);
    signal aki  :   signed(15 downto 0);

    -- Vector of signed signals
    signal xi_vec   :   gen_sig_array;
    signal yi_vec   :   gen_sig_array;
    signal zi_vec   :   gen_sig_array;

    signal ROM_vec  :   long_array;

    begin
    my_ROM : ROM port map(content => ROM_vec);

    GEN_STAGES: for i in 0 to 15 generate
        STAGE_PIPE_I:   STAGE_PIPE
            generic map(
                idx => i
            )
            port map(
                xi => xi_vec(i),
                yi => yi_vec(i),
                zi => zi_vec(i),
                ROM_I => ROM_vec(i),
                CLK => CLK,
                xo => xi_vec(i+1),
                yo => yi_vec(i+1),
                zo => zi_vec(i+1)
            );
    end generate GEN_STAGES;

    ASSIGN_IN:  process(xi, yi, zi) begin
        xi_vec(xi_vec'left) <= xi;
        yi_vec(yi_vec'left) <= yi;
        zi_vec(zi_vec'left) <= zi;
    end process ASSIGN_IN;
    
    ASSIGN_OUT: process(xi_vec, yi_vec, zi_vec) begin
        xo <= xi_vec(xi_vec'right);
        yo <= yi_vec(yi_vec'right);
        zo <= zi_vec(zi_vec'right);
    end process ASSIGN_OUT;


end architecture BHV;