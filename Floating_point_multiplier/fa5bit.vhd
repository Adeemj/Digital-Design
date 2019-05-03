library ieee;
use ieee.std_logic_1164.all;

entity fa5bit is								
port (a,b : in std_logic_vector(4 downto 0);					
cin : in std_logic;											
cout : out std_logic;	
s : out std_logic_vector(4 downto 0));			
end entity;									

architecture struct of fa5bit is						

component FA1bit is								
port (a,b,cin : in std_logic;							
       cout,s : out std_logic);				
end component;						

signal c : std_logic_vector(3 downto 0);					

begin										
	fa1: FA1bit port map (a(0),b(0),cin,c(0),s(0));	 
    fa2: FA1bit port map (a(1),b(1),c(0),c(1),s(1));
    fa3: FA1bit port map (a(2),b(2),c(1),c(2),s(2));
    fa4: FA1bit port map (a(3),b(3),c(2),c(3),s(3));
	fa5: FA1bit port map (a(4),b(4),c(3),cout,s(4));


end struct;								
