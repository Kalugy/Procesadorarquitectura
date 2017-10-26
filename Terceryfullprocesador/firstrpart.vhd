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
			  Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
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

COMPONENT UnidadControl
	PORT(
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           cond : in  STD_LOGIC_VECTOR (3 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
           rfDest : out  STD_LOGIC;
			  rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
			  wrEnMem : out  STD_LOGIC;
           wrEnRF : out  STD_LOGIC;	
			  pcSource : out STD_LOGIC_VECTOR (1 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0)
           	
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
			  wre : in STD_LOGIC;
			  cRd : out STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	
COMPONENT MuxRF
	PORT(
			  Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           O7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDEST : in  STD_LOGIC;
           nRD : out  STD_LOGIC_VECTOR (5 downto 0)
           	
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
			  icc : out STD_LOGIC_VECTOR (3 downto 0);
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
	

COMPONENT SEU_22
	PORT(
			  Imm_22 : in  STD_LOGIC_VECTOR (21 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	

COMPONENT SEU_30
	PORT(
			  Imm_30 : in  STD_LOGIC_VECTOR (29 downto 0);
           Imm_32 : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;		
	
COMPONENT MuxPC
	PORT(
			  Disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Selector : in  STD_LOGIC_VECTOR (1 downto 0);
			  Direccion_Out : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	
COMPONENT DataMemory
	PORT(
			  cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           WRENMEM : in  STD_LOGIC;
			  Reset : in STD_LOGIC;
           DataMem : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	
COMPONENT MuxDM
	PORT(
			  DataMem : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSC : in  STD_LOGIC_VECTOR (1 downto 0);
           DWR : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;		
	

signal a1,a2,a3,a4,a5,a18,a19,a20,a21,a22,a23,a24,a10,a31,a25,a32,a33: std_logic_vector(31 downto 0);

--ventanas
signal a6,a7: STD_LOGIC;
--nrs1,
signal a8,a9,a26,a27,a16: std_logic_vector(5 downto 0);

signal a11,a12,a14,a15,a29: STD_LOGIC;

signal a30,a28: std_logic_vector(3 downto 0);

signal a13,a17: std_logic_vector(1 downto 0);




begin

	ints_NPC: PC PORT MAP(
	
           inPC => a1,
           Reset => Resetext,
           Clk => Clkinext,
           outPC => a2
	);
	
	ints_PC: PC PORT MAP(
	
			  inPC => a2,
           Reset => Resetext,
           Clk => Clkinext,
           outPC => a5
          
	);
	
	ints_sum: Sumador32bit PORT MAP(
	
			  Oper1 => a5,
			  Oper2 =>"00000000000000000000000000000001",
           Result => a3
          
	);
	ints_IM: IM PORT MAP(
	
			  Address => a5,
           Reset => Resetext,
           Instruction => a4
          
	);
	ints_sumdisp30: Sumador32bit PORT MAP(
	
			  Oper1 => a31,
			  Oper2 => a5,
           Result => a33
          
	);
	
	ints_sumdisp22: Sumador32bit PORT MAP(
	
			  Oper1 => a10,
			  Oper2 => a5,
           Result => a32
          
	);
	
	
	
	ints_windowsmanager: Windowsmanager PORT MAP(
		
			  cwp =>a6,
			  rs1 =>a4(18 downto 14),
           rs2 =>a4(4 downto 0),
           rd =>a4(29 downto 25),
           op =>a4(31 downto 30),
           op3 =>a4(24 downto 19),
           
           cwpout=> a7,
           rs1out=>a9,
           rs2out=> a26,
           rdout=> a8
         
	);
	ints_rf: RF PORT MAP(
	
			  rs1 => a9,
           rs2 => a26,
           rd => a27,
           dwr => a25,
           rst => Resetext,
			  wre => a11,
			  cRd => a18,
           crs1 => a19,
           crs2 => a20
         
	);
	
	ints_muxrf: MuxRF PORT MAP(
	
			  Rd => a8,
           O7 => "001111",
           RFDEST => a12,
           nRD => a27
         
	);
	 
	ints_CU: UnidadControl PORT MAP(
			  op =>a4(31 downto 30),
           op3 =>a4(24 downto 19),
           op2 =>a4(24 downto 22),
           cond =>a4(28 downto 25),
           icc =>a30,
           rfDest  =>a12,
			  rfSource =>a13,
			  wrEnMem =>a14,
           wrEnRF =>a11,	
			  pcSource =>a17,
           AluOp =>a16
			  
          
	);

	ints_seu: SEU PORT MAP(
	
			  Instruction =>a4,
           OUTSEU =>a21
         
	);
	
	ints_mux32: MUX32 PORT MAP(
	
			  SEUIMM => a21, 
           CRS2 => a20,
           OPER2 => a22,
           Instruction => a4
         
	);
	ints_alu: ALU PORT MAP(
	
			  OPER1 => a19,
           OPER2 => a22,
			  c =>a29,
           ALURESULT => a23,
           ALUOP => a16
         
	);
	ints_psr: PSR PORT MAP(
	
			  nzvc => a28,
			  clk => Clkinext,
			  cwp => a6,
			  rest => Resetext,
			  ncwp => a7,
			  icc => a30,
           c => a29
         
	);
	ints_psrmodifier: PSR_Modifier PORT MAP(
	
			  oper1 => a19,
           oper2 => a22,
           aluop => a16,
           aluResult => a23,
           conditionalCodes => a28
         
	);
	ints_seu22: SEU_22 PORT MAP(
	
			  Imm_22 => a4(21 downto 0),
           Imm_32 => a10
         
	);
	ints_seu30: SEU_30 PORT MAP(
	
			  Imm_30 => a4(29 downto 0),
           Imm_32 => a31
         
	);
	ints_muxPC: MuxPC PORT MAP(
	
			  Disp30 => a33,
           Disp22 => a32,
           PC1 => a3,
           Direccion => a23,
           Selector => a17,
			  Direccion_Out => a1
         
	);
	ints_datamemmory: DataMemory PORT MAP(
	
			  cRD => a18,
           AluResult => a23,
           WRENMEM => a14,
			  Reset => Resetext,
           DataMem => a24
         
	);
	ints_muxdatamemory: MuxDM PORT MAP(
	
			  DataMem => a24,
           AluResult => a23,
           PC => a5,
           RFSC => a13,
           DWR => a25
         
	);
	
	Adressext<=a25;
end arqfirstrpart;

