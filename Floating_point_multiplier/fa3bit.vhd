library ieee;
use ieee.std_logic_1164.all;

entity fa3bit is								
port (a,b : in std_logic_vector(2 downto 0);					
cin : in std_logic;											
cout : out std_logic;
s : out std_logic_vector(2 downto 0));						
end entity;									

architecture struct of fa3bit is						

component FA1bit is								
port (a,b,cin : in std_logic;							
       cout,s : out std_logic);				
end component;						

signal c : std_logic_vector(1 downto 0);					

begin										
	fa1: FA1bit port map (a(0),b(0),cin,c(0),s(0));	 
	fa2: FA1bit port map (a(1),b(1),c(0),c(1),s(1));
	fa3: FA1bit port map (a(2),b(2),c(1),cout,s(2));


end struct;								
