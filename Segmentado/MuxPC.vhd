----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:06 10/20/2017 
-- Design Name: 
-- Module Name:    MuxPC - Behavioral 
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxPC is
    Port ( Disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (1 downto 0);
			  Direccion_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxPC;

architecture Behavioral of MuxPC is

begin
	process(Disp30, Disp22, PC1, Direccion, Selector)
begin
	case Selector is
		
		when "00" => Direccion_Out <= Disp30;
		when "01" => Direccion_Out <= Disp22;
		when "10" => Direccion_Out <= PC1;
		when "11" => Direccion_Out <= Direccion;
		when others => Direccion_Out <= PC1;
		
	end case;
end process;

end Behavioral;
