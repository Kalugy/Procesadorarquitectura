----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:56 09/26/2017 
-- Design Name: 
-- Module Name:    PC - arqPC 
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NPC is
    Port ( inNPC : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           outNPC : out  STD_LOGIC_VECTOR (31 downto 0));
end NPC;

architecture arqNPC of NPC is

begin
	process(Clk,Reset,inNPC)
	begin
		if(Reset = '1')then
			outNPC<="00000000000000000000000000000000";	
		else 
			if(rising_edge(Clk)) then
				outNPC<=inNPC;
			end if;
		end if;
	end process;
end arqNPC;

