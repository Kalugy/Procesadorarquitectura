----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:09:48 10/04/2017 
-- Design Name: 
-- Module Name:    CU - ArqCU 
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

entity CU is
    Port ( op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
	 
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture ArqCU of CU is

begin
	process(op, op3) begin
		case(op) is
		
			when "10" =>
				if(op3="000001") then--AND
					ALUOP <= "000001";
				end if;
				if(op3="000010") then--	OR
					ALUOP <= "000010";
				end if;
				if(op3="000011") then--	XOR
					ALUOP <= "000011";
				end if;
				if(op3="000111") then--	XNOR
					ALUOP <= "000111";
				end if;
		
				
				if(op3="000000") then--	ADD
					ALUOP <= "000000";
				end if;
				if(op3="000100") then--	SUB
					ALUOP <= "000100";
				end if;
				if(op3="000101") then--	ANDN
					ALUOP <= "000101";
				end if;
					if(op3="000110") then--	ORN
					ALUOP <= "000110";
				end if;
				
			
				--instrucciones con Conditional Codes
				if(op3="010100") then--SUBcc
					ALUOP <= "010100";
				end if;
				if(op3="010000") then--ADDcc
					ALUOP <= "010000";
				end if;
				if(op3="010001") then--ANDcc
					ALUOP <= "010001";
				end if;
				if(op3="010010") then--ORcc
					ALUOP <= "010010";
				end if;
				if(op3="010101") then--ANDNcc
					ALUOP <= "010101";
				end if;
				if(op3="010110") then--ORNcc
					ALUOP <= "010110";
				end if;
				if(op3="010011") then--XORcc
					ALUOP <= "010011";
				end if;
				
				if(op3="010111") then--XNORcc
					ALUOP <= "010111";
				end if;
				
				
				--instrucciones con Carry
				if(op3="001100") then--SUBX
					ALUOP <= "001100";
				end if;
				if(op3="001000") then--ADDX
					ALUOP <= "001000";
				end if;
				
				--instrucciones con carry y Conditional Codes
				if(op3="011000") then--ADDxcc
					ALUOP <= "011000";
				end if;
				
				if(op3="011100") then--SUBxcc
					ALUOP <= "011100";
				end if;
				
				--instrucciones con
				
				if(op3="100101") then--sll
					ALUOP <= "100101";
				end if;
				
				if(op3="100110") then--slr
					ALUOP <= "100110";
				end if; 
			--- instrucciones save y restore
			if(op3="111100") then--save
					ALUOP <= "111100";
				end if; 
			if(op3="111101") then--restore
					ALUOP <= "111101";
				end if; 
		
			--when "11" =>
			when others => ALUOP<= "111111";
		end case;
	
	
	end process;

end ArqCU;

