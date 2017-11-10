----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:07:22 10/20/2017 
-- Design Name: 
-- Module Name:    SEU_22 - Behavioral 
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
entity SEU_22 is
    Port ( Imm_22 : in  STD_LOGIC_VECTOR (21 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_22;

architecture Behavioral of SEU_22 is
begin
	process (Imm_22 ) begin
		if(Imm_22(21) = '1')then
			Imm_32<= "1111111111" & Imm_22;
		elsif(Imm_22(21) = '0')then
			Imm_32<= "0000000000" & Imm_22;
		end if;
	end process;	

end Behavioral;


