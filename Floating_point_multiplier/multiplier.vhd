library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
port (input : in std_logic_vector(7 downto 0);
clk : in std_logic;
enable : in std_logic;  -- enable=1 init
reset : in std_logic;	
outputs : out std_logic_vector(2 downto 0)); 	
end entity multiplier ;

architecture struct of multiplier is

component mux_2to1_8bit is
port (   a : in std_logic_vector(7 downto 0);
b : in std_logic_vector(7 downto 0);
s : in std_logic;
y : out std_logic_vector(7 downto 0));
end component;

component register8bit is
port (
inputs  : in std_logic_vector(7 downto 0);
clk : in std_logic;
reset: in std_logic;
outputs : out std_logic_vector(7 downto 0));
end component;

component shift_right2_8bit is
port(input: in std_logic_vector(7 downto 0);
shifted: out std_logic_vector(7 downto 0);
to_dff : out std_logic);
end component;

component dflipflop is				--entity name is defined
port (d,clk,reset : in std_logic;		--input ports are named and their datatype is defined
		q : out std_logic);		--output ports are named and their datatype is defined
end component;


signal  mux2reg, reg2shift, shift2mux : std_logic_vector(7 downto 0);
signal shift2dff, dff_out : std_logic;
 

begin

register16 :  register8bit port map(mux2reg, clk, reset, reg2shift);
shift_circuit : shift_right2_8bit port map (reg2shift, shift2mux, shift2dff);
mux : mux_2to1_8bit port map( shift2mux,input, enable, mux2reg);
dff : dflipflop port map (shift2dff, clk, reset, dff_out);
outputs(2) <= reg2shift(1);
outputs(1) <= reg2shift(0);
outputs(0) <= dff_out;
    
end struct ; -- struct
