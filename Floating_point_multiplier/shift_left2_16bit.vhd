library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.std_logic_unsigned.all; 

entity shift_left2_16bit is
port(input: in std_logic_vector(15 downto 0);
	shifted: out std_logic_vector(15 downto 0));
end entity;

architecture struct of shift_left2_16bit is

begin

shift_generate : for i in 0 to 13 generate
UA : shifted(i+2) <= input(i);
end generate;

shifted(0) <= '0';
shifted(1) <= '0';

end struct;