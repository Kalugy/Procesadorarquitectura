----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:12 09/26/2017 
-- Design Name: 
-- Module Name:    firstrpart - arqfirstrpart 
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

entity firstrpart is
    Port ( Resetext : in  STD_LOGIC;
           Clkinext : in  STD_LOGIC;
           Adressext : out  STD_LOGIC_VECTOR (31 downto 0));
end firstrpart;

architecture arqfirstrpart of firstrpart is

COMPONENT Sumador32bit
	PORT(
			  Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Result : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;
	
	
COMPONENT NPC
	PORT(
			  inNPC : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           outNPC : out  STD_LOGIC_VECTOR (31 downto 0)         	
		);
	END COMPONENT;

COMPONENT PC
	PORT(
			  inPC : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           outPC : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	

COMPONENT IM
	PORT(
			  Address : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	

signal aux1,aux2,aux3,aux4: std_logic_vector(31 downto 0);

begin

	U0: NPC PORT MAP(
	
			  inNPC => aux1,
           Reset => Resetext,
           Clk => Clkinext,
           outNPC => aux2
          
	);
	
	U1: PC PORT MAP(
	
			  inPC => aux2,
           Reset => Resetext,
           Clk => Clkinext,
           outPC => aux3
          
	);
	
	U2: Sumador32bit PORT MAP(
	
			  Oper1 => aux3,
           Result => aux1
          
	);
	
	U3: IM PORT MAP(
	
			  Address => aux3,
           Reset => Resetext,
           Instruction => Adressext
          
	);
	


end arqfirstrpart;

