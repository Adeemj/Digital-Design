-- vhdl code of rising edge triggered d fip-flop with asynchronous reset
-- architecture is written in behavioural coding style

library ieee;
use ieee.std_logic_1164.all;

entity dflipflop is				--entity name is defined
port (d,clk,reset : in std_logic;		--input ports are named and their datatype is defined
		q : out std_logic);		--output ports are named and their datatype is defined
end entity;					--entity ends

architecture dflipflop_beh of dflipflop is	--architecture name is defined and linked to the above entity
begin						--architecture begins 
	
	process(clk,reset)			--process is defined, the bracket contains the sensitivity list of the defined process
						--sensitivity list means the an iteration of a process is initiated whenever the value of a signal in the sensitivity list changes 
	begin					--process begins
		
		if (reset = '1') then		
			q <= '0';		--action to be taken on reset
		elsif (rising_edge(clk)) then	--rising_edge(clk) detects transition of "clk" signal from logic '0' to logic '1' 
			q <= d;			--action to be taken on positive edge of "clk" signal
		end if;				--if ends
	
	end process;				--process ends

end dflipflop_beh;				--architecture ends

