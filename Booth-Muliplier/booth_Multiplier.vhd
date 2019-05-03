library ieee;
use ieee.std_logic_1164.all;

entity booth_Multiplier is
port (num1, num2 : in std_logic_vector(7 downto 0);
		clk, reset : in std_logic;
		output : out std_logic_vector(15 downto 0));
end entity;

architecture Structure of booth_Multiplier is

	component mux_8to3_16bit is
	port(in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic_vector(15 downto 0);
			s0, s1, s2 : in std_logic;
			output : out std_logic_vector(15 downto 0));
	end component;

	component complementor is
	port (input : in std_logic_vector(15 downto 0);
			output : out std_logic_vector(15 downto 0));
			
	end component;

	component FA16bit is
	port (A, B : in std_logic_vector(15 downto 0);
			Cin : in std_logic;
			Cout : out std_logic;
			Sum : out std_logic_vector(15 downto 0)
			);
	end component;

	component register16bit is
	port (	  inputs : in std_logic_vector(15 downto 0);	
		  clk,reset : in std_logic;		 
		  outputs : out std_logic_vector(15 downto 0));	
	end component;

	component multiplicand is
	port (input : in std_logic_vector(7 downto 0);
			clk : in std_logic;
			enable : in std_logic;
			reset : in std_logic;
			outputs : out std_logic_vector(15 downto 0));
	end component;
	
	component enable_controller is
	port (A1, clk, A2, rst : in std_logic;
			enable : out std_logic
			);
	end component;
	
	component multiplier is
	port (input : in std_logic_vector(7 downto 0);
			clk : in std_logic;
			enable : in std_logic;
			reset : in std_logic;
			outputs : out std_logic_vector(2 downto 0));
	end component;
	
	component shift_left1_16bit is
	port(input: in std_logic_vector(15 downto 0);
		shifted: out std_logic_vector(15 downto 0));
	end component;
	
	component shift_left2_16bit is
	port(input: in std_logic_vector(15 downto 0);
			shifted: out std_logic_vector(15 downto 0));
	end component;


	signal multiplier_to_mux : std_logic_vector(2 downto 0);  
	signal A : std_logic_vector(15 downto 0);
	signal minus_A : std_logic_vector(15 downto 0);  
	signal two_A : std_logic_vector(15 downto 0);
	signal minus_two_A : std_logic_vector(15 downto 0);
	signal mux2adder : std_logic_vector(15 downto 0);
	signal reg2adder : std_logic_vector(15 downto 0);
	signal adder2reg : std_logic_vector(15 downto 0);
	signal to_enable : std_logic;
	signal cout : std_logic;
	
	begin
			C1 : enable_controller port map ('0', clk, '1', reset, to_enable);
			C2 : multiplier port map (num2,clk, to_enable, reset, multiplier_to_mux);
			C3 : multiplicand port map (num1, clk, to_enable, reset, A);
			C4 : complementor port map (A, minus_A);
			C5 : complementor port map (two_A, minus_two_A);
			C6 : shift_left1_16bit port map (A, two_A);
			C7 : mux_8to3_16bit port map ("0000000000000000", A, A, two_A, minus_two_A, minus_A, minus_A, "0000000000000000", 
												multiplier_to_mux(0), multiplier_to_mux(1), multiplier_to_mux(2), mux2adder);
			C8 : FA16bit port map (mux2adder, reg2adder, '0', cout, adder2reg);
			C9 : register16bit port map (adder2reg, clk, reset, reg2adder);
		    output <= reg2adder;
end Structure;
			
