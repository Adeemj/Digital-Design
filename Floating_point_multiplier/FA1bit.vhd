library ieee;
use ieee.std_logic_1164.all;

entity FA1bit is
port ( a, b, cin : in std_logic;
		  cout, s : out std_logic
		);
end entity;

architecture struct of FA1bit is
begin 
		s <= (a xor b) xor Cin;
		cout <= (a and b) or (b and cin) or (cin and a);
end struct;