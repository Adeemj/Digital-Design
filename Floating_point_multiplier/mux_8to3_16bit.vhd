library ieee;
use ieee.std_logic_1164.all;

entity mux_8to3_16bit is
port(in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic_vector(15 downto 0);
		s0, s1, s2 : in std_logic;
		output : out std_logic_vector(15 downto 0));
end entity;

architecture structure of mux_8to3_16bit is

	component mux_8to3 is
		port( in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic;
				s0, s1, s2 : in std_logic;
				output : out std_logic);
	end component;

begin 

	select_vect_generate : for i in 0 to 15 generate
		UA : mux_8to3 port map(in0(i), in1(i), in2(i), in3(i), in4(i), in5(i), in6(i), in7(i), s0, s1, s2, output(i));
	end generate;

end structure;
	


