----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin
	c<=nzvc(0);
end Behavioral;

