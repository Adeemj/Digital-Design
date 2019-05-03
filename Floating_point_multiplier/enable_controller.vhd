library ieee;
use ieee.std_logic_1164.all;

entity enable_controller is
port (A1, clk, A2, rst : in std_logic;
		enable : out std_logic);
end entity;

architecture structure of enable_controller is

component dflipflop is
port (d,clk,reset : in std_logic;		
		q : out std_logic);		
end component;

component mux_2to1 is
port (A : in std_logic;
		B : in std_logic;
		S : in std_logic;
		O : out std_logic);
end component;

signal temp : std_logic;

begin 
		C1 : mux_2to1 port map (A1, A2, clk, temp);
		C2 : dflipflop port map (temp, clk, rst, enable);
end structure;