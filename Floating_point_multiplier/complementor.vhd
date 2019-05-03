library ieee;
use ieee.std_logic_1164.all;

entity complementor is
port (input : in std_logic_vector(15 downto 0);
		output : out std_logic_vector(15 downto 0));
		
end entity;

architecture structure of complementor is

component FA16bit is
port (a, b : in std_logic_vector(15 downto 0);
		cin : in std_logic;
		cout : out std_logic;
		s : out std_logic_vector(15 downto 0)
		);
end component;

signal inv_input : std_logic_vector(15 downto 0);
signal cout : std_logic;

begin
		inv_input <= (not input);
		I1: FA16bit port map( inv_input, "0000000000000000", '1', cout, output);
end structure;
