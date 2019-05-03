library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity shift_left1_10bit is
port(input: in std_logic_vector(9 downto 0);
	shifted: out std_logic_vector(9 downto 0));
end entity shift_left1_10bit;

architecture struct of shift_left1_10bit is

begin

shift_generate : for i in 0 to 8 generate
UA : shifted(i+1) <= input(i);
end generate;

shifted(0) <= '0';


end struct;