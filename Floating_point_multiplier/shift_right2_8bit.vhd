library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.std_logic_unsigned.all; 

entity shift_right2_8bit is
port(input: in std_logic_vector(7 downto 0);
	shifted: out std_logic_vector(7 downto 0);
	to_dff : out std_logic);
end entity;

architecture struct of shift_right2_8bit is

begin

to_dff <= input(1);

shift_generate : for i in 0 to 5 generate
UA : shifted(i) <= input(i+2);
end generate;

shifted(6) <= input(7);
shifted(7) <= input(7);

end struct;