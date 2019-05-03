library ieee;
use ieee.std_logic_1164.all;

entity mux_8to3 is
port( in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic;
		s0, s1, s2 : in std_logic;
		output : out std_logic);
end entity;

architecture structure of mux_8to3 is
begin 
		output <= ((not s2) and (not s1) and (not s0) and in0) or
					 ((not s2) and (not s1) and (s0) and in1) or 
					 ((not s2) and (s1) and (not s0) and in2) or
					 ((not s2) and (s1) and (s0) and in3) or
					 ((s2) and (not s1) and (not s0) and in4) or
					 ((s2) and (not s1) and (s0) and in5) or
					 ((s2) and (s1) and (not s0) and in6) or
					 ((s2) and (s1) and (s0) and in7);
end structure;
