library ieee;
use ieee.std_logic_1164.all;

entity floating_point_multiplier is
port(fl_num1, fl_num2 : in std_logic_vector(7 downto 0);
clk : in std_logic;
reset : in std_logic;
fl_product : out std_logic_vector(15 downto 0)
);
end entity floating_point_multiplier;

architecture struct of floating_point_multiplier is

component booth_multiplier is
port(num1, num2 : in std_logic_vector(7 downto 0);
clk : in std_logic;
reset : in std_logic;
output : out std_logic_vector(15 downto 0));
end component booth_multiplier;

component product_adjust is
port (input : in std_logic_vector(9 downto 0);
output : out std_logic_vector(9 downto 0)); 	
end component product_adjust ;

component exponent is
port (exp1, exp2 : in std_logic_vector(2 downto 0);	
msb : std_logic;
exp_product : out std_logic_vector(4 downto 0)); 	
end component exponent ;

signal booth_out : std_logic_vector(15 downto 0);
signal input1_to_booth, input2_to_booth : std_logic_vector(7 downto 0);

begin
input1_to_booth(7 downto 4) <= "0001";
input2_to_booth(7 downto 4) <= "0001";
input1_to_booth(3 downto 0) <= fl_num1(3 downto 0);
input2_to_booth(3 downto 0) <= fl_num2(3 downto 0);

booth_multp : booth_multiplier port map(input1_to_booth, input2_to_booth, clk, reset, booth_out);
product_adj : product_adjust port map(booth_out(9 downto 0), fl_product(9 downto 0));
exponent1 : exponent port map(fl_num1(6 downto 4), fl_num2(6 downto 4), booth_out(9), fl_product(14 downto 10));
fl_product(15) <= fl_num1(7) xor fl_num2(7);


end struct;