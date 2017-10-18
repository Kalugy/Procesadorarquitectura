----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in  STD_LOGIC_VECTOR ;
			  cwp : out  STD_LOGIC_VECTOR (1 downto 0);
			  ncwp : in  STD_LOGIC_VECTOR (1 downto 0);
           c : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin
	
	if(rising_edge(clk))then
		c<=nzvc(0);
		cwp<=ncwp;
		
end Behavioral;

