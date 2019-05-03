library ieee;
use ieee.std_logic_1164.all;

entity FA16bit is
port (a, b : in std_logic_vector(15 downto 0);
		cin : in std_logic;
		cout : out std_logic;
		s : out std_logic_vector(15 downto 0)
		);
end entity;

architecture structure of FA16bit is

component FA1bit is
port ( a, b, cin : in std_logic;
		 cout, s  : out std_logic
		);
end component;

signal carry : std_logic_vector(14 downto 0);

begin 
FA1 : FA1bit port map (a(0), b(0), cin, carry(0), s(0));

full_adders_generate : for i in 1 to 14 generate
UA : FA1bit port map (a(i), b(i), carry(i-1), carry(i), s(i));
end generate;

FA16 : FA1bit port map (a(15), b(15), carry(14), cout, s(15));

end structure;