library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
port (A : in std_logic;
		B : in std_logic;
		S : in std_logic;
		O : out std_logic);
end entity;

architecture structure of mux_2to1 is
begin 
		O <= (A and S) or (B and (not S));
end structure;