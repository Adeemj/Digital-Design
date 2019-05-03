library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1_16bit is
port (   a : in std_logic_vector(15 downto 0);
		 b : in std_logic_vector(15 downto 0);
		 s : in std_logic;
		 y : out std_logic_vector(15 downto 0));
end entity mux_2to1_16bit ;

architecture structure of mux_2to1_16bit is
	component mux_2to1 is
		port (A : in std_logic;
		B : in std_logic;
		S : in std_logic;
		O : out std_logic);
	end component;
begin

	mux_generate : for i in 0 to 15 generate
	UA : mux_2to1 port map(a(i), b(i), s, y(i));
	end generate;
	
end structure ;