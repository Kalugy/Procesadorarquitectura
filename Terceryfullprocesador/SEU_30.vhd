----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:14:04 10/20/2017 
-- Design Name: 
-- Module Name:    SEU_30 - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU_30 is
    Port ( Imm_30 : in  STD_LOGIC_VECTOR (29 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_30;

architecture Behavioral of SEU_30 is
begin
	process (Imm_30 ) begin
		if(Imm_30(29) = '1')then
			Imm_32<= "11" & Imm_30;
		elsif(Imm_30(29) = '0')then
			Imm_32<= "00" & Imm_30;
		end if;
	end process;	

end Behavioral;
