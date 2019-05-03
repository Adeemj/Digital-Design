library ieee;
use ieee.std_logic_1164.all;

entity FA1bit is
port ( A, B, Cin : in std_logic;
		  Cout, Sum : out std_logic
		);
end entity;

architecture struct of FA1bit is
begin 
		Sum <= (A xor B) xor Cin;
		Cout <= (A and B) or (B and Cin) or (Cin and A);
end struct;