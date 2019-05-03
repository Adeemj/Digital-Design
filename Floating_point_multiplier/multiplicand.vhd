library ieee;
use ieee.std_logic_1164.all;

entity multiplicand is
port (input : in std_logic_vector(7 downto 0);
clk : in std_logic;
enable : in std_logic;  -- enable=1 init
reset : in std_logic;	
outputs : out std_logic_vector(15 downto 0)); 	
end entity;

architecture structure of multiplicand is

component mux_2to1_16bit is	
port (   a : in std_logic_vector(15 downto 0);
b : in std_logic_vector(15 downto 0);
s : in std_logic;
y : out std_logic_vector(15 downto 0));			
end component;

component sign_ext8to16 is
port(input: in std_logic_vector(7 downto 0);
extended: out std_logic_vector(15 downto 0));
end component;

component register16bit is
port (
inputs  : in std_logic_vector(15 downto 0);
clk : in std_logic;
reset: in std_logic;
outputs : out std_logic_vector(15 downto 0)
);
end component;

component shift_left2_16bit is
port(input: in std_logic_vector(15 downto 0);
shifted: out std_logic_vector(15 downto 0));
end component;


signal ext2mux, shift2mux, mux2reg, reg2shift : std_logic_vector(15 downto 0);

begin

sign_ext : sign_ext8to16 port map (input, ext2mux);
register16 :  register16bit port map(mux2reg, clk, reset, reg2shift);
shift_circuit : shift_left2_16bit port map (reg2shift, shift2mux);
mux : mux_2to1_16bit port map(shift2mux, ext2mux, enable, mux2reg);
outputs <= reg2shift;

end structure ;