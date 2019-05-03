library ieee;
use ieee.std_logic_1164.all;

entity FA16bit is
port (A, B : in std_logic_vector(15 downto 0);
		Cin : in std_logic;
		Cout : out std_logic;
		Sum : out std_logic_vector(15 downto 0)
		);
end entity;

architecture structure of FA16bit is

component FA1bit is
port ( A, B, Cin : in std_logic;
		 Cout, Sum  : out std_logic
		);
end component;

signal carry : std_logic_vector(14 downto 0);

begin 
FA1 : FA1bit port map (A(0), B(0), Cin, carry(0), Sum(0));

full_adders_generate : for i in 1 to 14 generate
UA : FA1bit port map (A(i), B(i), carry(i-1), carry(i), Sum(i));
end generate;

FA16 : FA1bit port map (A(15), B(15), carry(14), Cout, Sum(15));

end structure;