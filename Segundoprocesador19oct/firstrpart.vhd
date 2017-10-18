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

COMPONENT CU
	PORT(
			  Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0)
           	
		);
	END COMPONENT;	
	
COMPONENT SEU
	PORT(
			  Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           OUTSEU : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;		
	
COMPONENT MUX32
	PORT(
			  SEUIMM : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPER2 : out  STD_LOGIC_VECTOR (31 downto 0);
           Instruction : in  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;			
	
COMPONENT ALU
	PORT(
			  OPER1 : in  STD_LOGIC_VECTOR (31 downto 0);
           OPER2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0)
           	
		);
	END COMPONENT;		
COMPONENT RF
	PORT(
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;		
	
	

signal aux1,aux2,aux3,aux4,aux6,aux7,aux8,aux9,aux10: std_logic_vector(31 downto 0);
signal aux5: std_logic_vector(5 downto 0);

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
           Instruction => aux4
          
	);
	
	U4: CU PORT MAP(
	
			  Instruction => aux4,
           ALUOP => aux5
          
	);

	U5: SEU PORT MAP(
	
			  Instruction =>aux4,
           OUTSEU =>aux6
         
	);
	U6: MUX32 PORT MAP(
	
			  SEUIMM => aux6, 
           CRS2 => aux7,
           OPER2 => aux9,
           Instruction => aux4
         
	);
	U7: ALU PORT MAP(
	
			  OPER1 => aux8,
           OPER2 => aux9,
           ALURESULT => aux10,
           ALUOP => aux5
         
	);

	U8: RF PORT MAP(
	
			  rs1 => aux4(18 downto 14),
           rs2 => aux4(4 downto 0),
           rd => aux4(29 downto 25),
           dwr => aux10,
           rst => Resetext,
           crs1 => aux8,
           crs2 => aux7
         
	);
	Adressext<=aux10;
end arqfirstrpart;

