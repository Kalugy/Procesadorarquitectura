----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:18 09/27/2017 
-- Design Name: 
-- Module Name:    Sumador32bit - Arq_Sumador32bit 
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

entity Sumador32bit is
Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Sumador32bit;

architecture arq_Sumador32bit of Sumador32bit is
Signal tmp : std_logic_vector(31 downto 0):= "00000000000000000000000000000000";

begin
	process(Oper1)
	begin
		tmp<= Oper1 + "00000000000000000000000000000100";
	
	end process;
	Result<= tmp;

end arq_Sumador32bit;

