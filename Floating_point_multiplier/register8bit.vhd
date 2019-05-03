library ieee;
use ieee.std_logic_1164.all;

entity register8bit is

port (
inputs  : in std_logic_vector(7 downto 0);
clk : in std_logic;
reset: in std_logic;
outputs : out std_logic_vector(7 downto 0)
);

end entity;


architecture struct of register8bit is

component dflipflop is					
port (d,clk,reset : in std_logic;			
        q : out std_logic);			
end component;

begin

register_generate : for i in 0 to 7 generate
UA : dflipflop port map (inputs(i), clk, reset, outputs(i));
end generate;

end struct ; -- struct