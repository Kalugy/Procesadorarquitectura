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
			  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
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
			  c :in  STD_LOGIC;
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (5 downto 0)
           	
		);
	END COMPONENT;		
COMPONENT RF
	PORT(
			  rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;		
	
COMPONENT Windowsmanager
	PORT(
			  cwp : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwpout : out  STD_LOGIC;
           rs1out : out  STD_LOGIC_VECTOR (5 downto 0);
           rs2out : out  STD_LOGIC_VECTOR (5 downto 0);
           rdout : out  STD_LOGIC_VECTOR (5 downto 0):=(others=>'0')
           	
		);
	END COMPONENT;		
COMPONENT PSR
	PORT(
			  nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in  STD_LOGIC ;
			  cwp : out  STD_LOGIC;
			  ncwp : in  STD_LOGIC;
			  rest : in  STD_LOGIC;
           c : out  STD_LOGIC
           	
		);
	END COMPONENT;	
	
COMPONENT PSR_Modifier
	PORT(
			  oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           conditionalCodes : out  STD_LOGIC_VECTOR (3 downto 0)
           	
		);
	END COMPONENT;		
	

signal aux1,aux2,aux3,aux4,aux6,aux7,aux8,aux9,aux10: std_logic_vector(31 downto 0);
signal aux5: std_logic_vector(5 downto 0);
signal aux13,aux14,aux15: std_logic_vector(5 downto 0);
signal aux11,aux12: STD_LOGIC;
signal aux16: STD_LOGIC_VECTOR (3 downto 0);
signal aux17: STD_LOGIC;
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
	
			  op =>aux4(31 downto 30),
           op3 =>aux4(24 downto 19),
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
			  c =>aux17,
           ALURESULT => aux10,
           ALUOP => aux5
         
	);

	U8: RF PORT MAP(
	
			  rs1 => aux13,
           rs2 => aux14,
           rd => aux15,
           dwr => aux10,
           rst => Resetext,
           crs1 => aux8,
           crs2 => aux7
         
	);
	
	
	U9: Windowsmanager PORT MAP(
		
			  cwp =>aux12,
			  rs1 =>aux4(18 downto 14),
           rs2 =>aux4(4 downto 0),
           rd =>aux4(29 downto 25),
           op =>aux4(31 downto 30),
           op3 =>aux4(24 downto 19),
           
           cwpout=> aux11,
           rs1out=>aux13,
           rs2out=> aux14,
           rdout=> aux15
         
	);
	U10: PSR PORT MAP(
	
			  nzvc => aux16,
			  clk => Clkinext,
			  cwp => aux12,
			  rest => Resetext,
			  ncwp => aux11,
           c => aux17
         
	);
	U11: PSR_Modifier PORT MAP(
	
			  oper1 => aux8,
           oper2 => aux9,
           aluop => aux5,
           aluResult => aux10,
           conditionalCodes => aux16
         
	);
	Adressext<=aux10;
end arqfirstrpart;

