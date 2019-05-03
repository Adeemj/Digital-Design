library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.std_logic_unsigned.all; 

entity sign_ext8to16 is
port(input: in std_logic_vector(7 downto 0);
	extended: out std_logic_vector(15 downto 0));
end entity;

architecture struct of sign_ext8to16 is

begin

extend_generate : for i in 0 to 7 generate
UA : extended(i) <= input(i);
end generate;

short_msb_generate : for i in 8 to 15 generate
UA : extended(i) <= input(7);
end generate;

end struct;