----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:19:49 10/04/2017 
-- Design Name: 
-- Module Name:    ALU - ARQALU 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( OPER1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPER2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0));
end ALU;

architecture ARQALU of ALU is

begin
	process(OPER1,OPER2,ALUOP)
	begin
		if(ALUOP = "000010")then
			ALURESULT<= OPER1 OR OPER2;
		elsif(ALUOP = "000011")then
			ALURESULT<= OPER1 XOR OPER2;		
		elsif(ALUOP = "000000")then
			ALURESULT<= OPER1 + OPER2;	
		elsif(ALUOP = "000100")then
			ALURESULT<= OPER1 - OPER2;		
		elsif(ALUOP = "000001")then
			ALURESULT<= OPER1 AND OPER2;	
		elsif(ALUOP = "000101")then
			ALURESULT<= OPER1 AND (not OPER2);			
		elsif(ALUOP = "000110")then
			ALURESULT<= OPER1 NOR OPER2;
		elsif(ALUOP = "000111")then
			ALURESULT<= OPER1 XNOR OPER2;	
		end if;
	end process;	
end ARQALU;

