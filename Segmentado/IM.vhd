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

type rom_type is array (63 downto 0) of std_logic_vector (31 downto 0);
signal ROM : rom_type := (	"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"00000000000000000000000000000000", "00000000000000000000000000000000",
									"01111111111111111111111111110001", "10100110000100000010000000000011",
									"10100100000100000010000000000101", "00000001000000000000000000000000",
									"10000011110000111110000000000000", "10010000000100000000000000010000",
									"00000110101111111111111111111011", "10000000101001000100000000010011",
									"10100010000100000000000000010100", "10101000000001000110000000000001",
									"10100000000100000000000000010100", "10101000000001000000000000010010",
									"00110110100000000000000000001000", "10000000101001000100000000010011",	
									"10100010000100000010000000000000", "10100000000100000010000000000000");

begin

    process (Reset,Address,rom)
    begin
        if (Reset='1') then
				Instruction <= "00000000000000000000000000000000";
		  else
            Instruction <= ROM(conv_integer(Address(5 downto 0)));  
        end if;
    end process;
end Arqim;

