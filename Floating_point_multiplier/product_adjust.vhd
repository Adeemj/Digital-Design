library ieee;
use ieee.std_logic_1164.all;

entity product_adjust is
port (input : in std_logic_vector(9 downto 0);
output : out std_logic_vector(9 downto 0)); 	
end entity product_adjust ;

architecture struct of product_adjust is

component mux_2to1_10bit is
port (   a : in std_logic_vector(9 downto 0);
b : in std_logic_vector(9 downto 0);
s : in std_logic;
y : out std_logic_vector(9 downto 0));
end component mux_2to1_10bit ;

component shift_left1_10bit is
port(input: in std_logic_vector(9 downto 0);
shifted: out std_logic_vector(9 downto 0));
end component shift_left1_10bit;

component shift_left2_10bit is
port(input: in std_logic_vector(9 downto 0);
shifted: out std_logic_vector(9 downto 0));
end component shift_left2_10bit;

signal input_to_shift1, input_to_shift2, shift1_to_mux, shift2_to_mux : std_logic_vector(9 downto 0);

begin

shift1 :  shift_left1_10bit port map(input, shift1_to_mux);
shift2 : shift_left2_10bit port map(input, shift2_to_mux);
mux : mux_2to1_10bit port map ( shift1_to_mux, shift2_to_mux, input(9),output);

end struct;
