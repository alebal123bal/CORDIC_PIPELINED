library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.pack_ROM.all;


entity ROM is
	port(
        content: out long_array
	);
end ROM;

-- arctan(2^-n) are 45°, 26.6°, 14° etc.
-- Real angles are normalized by a division of 256, in order to represent [-180°, 180°]
-- For example 22° =>  22°/256 = 0.0859°

architecture BHV of ROM is    
    -- Divided by 2 in order to represent a whole 1 
    signal content_norm_2: long_array := 
    (
        x"0B40",
        x"06A4",
        x"0382",
        x"01C8",
        x"00E5",
        x"0072",
        x"0039",
        x"001C",
        x"000E",
        x"0007",
        x"0003",
        x"0002",
        x"0001",
        x"0000",
        x"0000",
        x"0000"
    );

	begin
		process(all) begin
			content <= content_norm_2;
		end process;
end BHV;



