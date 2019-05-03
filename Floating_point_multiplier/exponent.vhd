library ieee;
use ieee.std_logic_1164.all;

entity exponent is
port (exp1, exp2 : in std_logic_vector(2 downto 0);	
msb : std_logic;
exp_product : out std_logic_vector(4 downto 0)); 	
end entity exponent ;

architecture struct of exponent is

component fa3bit is								
port (a,b : in std_logic_vector(2 downto 0);					
cin : in std_logic;											
cout : out std_logic;
s : out std_logic_vector(2 downto 0));						
end component;

component fa5bit is								
port (a,b : in std_logic_vector(4 downto 0);					
cin : in std_logic;	
cout : out std_logic;						
s : out std_logic_vector(4 downto 0));						
end component;	

signal sum_adder3bit : std_logic_vector(2 downto 0);
signal cout : std_logic;
signal temp : std_logic;
signal nine : std_logic_vector(4 downto 0);
signal in_adder5bit : std_logic_vector(4 downto 0);

begin

nine <= "01001";
adder3bit : fa3bit port map(exp1, exp2, '0',  cout, sum_adder3bit);
in_adder5bit(2 downto 0) <= sum_adder3bit;
in_adder5bit(3) <= cout;
in_adder5bit(4) <= '0';
adder5bit : fa5bit port map(in_adder5bit, nine, msb, temp, exp_product);

end struct ; -- struct