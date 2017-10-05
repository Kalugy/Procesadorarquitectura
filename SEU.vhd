----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:39:43 10/04/2017 
-- Design Name: 
-- Module Name:    SEU - arqSEU 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU is
    Port ( Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           OUTSEU : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture arqSEU of SEU is
begin
	process(Instruction)
	begin 
		if(Instruction(12) = '1')then
			OUTSEU<= "1111111111111111111" & Instruction(12 downto 0);
		elsif(Instruction(12) = '0')then
			OUTSEU<= "0000000000000000000" & Instruction(12 downto 0);
		end if;
	end process;	
end arqSEU;

