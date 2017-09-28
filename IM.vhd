----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:34 09/26/2017 
-- Design Name: 
-- Module Name:    IM - Arqim 
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

use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IM is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;

architecture Arqim of IM is

type rom_type is array (0 to 3) of std_logic_vector (31 downto 0);                 
    signal ROM : rom_type:= ("00000000000000000000000000000001", "00000000000000000000000000000010", 
									  "00000000000000000000000000000011", "00000000000000000000000000000111");                        

    signal rdata : std_logic_vector(31 downto 0);
begin

    
	
	 rdata <= ROM(conv_integer(Address));
    process (Reset)
    begin
        if (Reset='1') then
				Instruction <= "00000000000000000000000000000000";
		  elsif(Reset='0')then
            Instruction <= rdata;
            
        end if;
    end process;


end Arqim;

