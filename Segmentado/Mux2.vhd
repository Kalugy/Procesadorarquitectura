----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:44:00 11/09/2017 
-- Design Name: 
-- Module Name:    Mux2 - Behavioral 
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

entity Mux2 is
    Port ( Entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           sumador : in  STD_LOGIC_VECTOR (31 downto 0);
           Cuentrada : in  STD_LOGIC_VECTOR (1 downto 0);
           posicion : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux2;

architecture Behavioral of Mux2 is

begin
	process(Entrada,sumador,Cuentrada)
	begin

		if (Cuentrada="10") then
			posicion<=sumador;
		elsif (Cuentrada="00" or Cuentrada="01" or Cuentrada="11") then
			posicion<=Entrada;
		end if;
			
	end process;
	
end Behavioral;

