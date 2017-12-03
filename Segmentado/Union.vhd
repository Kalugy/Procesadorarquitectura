----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:52 11/11/2017 
-- Design Name: 
-- Module Name:    Union - Behavioral 
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

entity Union is
    Port ( Clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  Salidaunion :out STD_LOGIC_VECTOR(31 downto 0)
			  );
end Union;

architecture Behavioral of Union is


COMPONENT fetch
	PORT(
			  Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CUentrada : in  STD_LOGIC_VECTOR(1 downto 0);
           Entradain : in  STD_LOGIC_VECTOR (31 downto 0);
           Instruccionout : out  STD_LOGIC_VECTOR (31 downto 0);
           PCout : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	


COMPONENT Decode
	PORT(
			  Instruction : in  STD_LOGIC_VECTOR (31 downto 0);
           posicionin : in  STD_LOGIC_VECTOR (31 downto 0);
           Regtomemin : in  STD_LOGIC_VECTOR (31 downto 0);
           cwpin : in  STD_LOGIC;
			  iccin : in  STD_LOGIC_VECTOR (3 downto 0);
			  Resetext : in  STD_LOGIC;
           ncwpout : out  STD_LOGIC;
           callout : out  STD_LOGIC_VECTOR (31 downto 0);
           ifout : out  STD_LOGIC_VECTOR (31 downto 0);
           rfsourceout : out  STD_LOGIC_VECTOR (1 downto 0);
           wrenmen : out  STD_LOGIC;
           pcsource : out  STD_LOGIC_VECTOR (1 downto 0);
			  Cuentrada : out  STD_LOGIC_VECTOR (1 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0);
			  a18 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs1out : out  STD_LOGIC_VECTOR (31 downto 0);
           op2out : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;	
COMPONENT Execute
	PORT(
			  callin : in  STD_LOGIC_VECTOR (31 downto 0);
           ifin : in  STD_LOGIC_VECTOR (31 downto 0);
           pcsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
           aluopin : in  STD_LOGIC_VECTOR (5 downto 0);
           op1in : in  STD_LOGIC_VECTOR (31 downto 0);
           op2in : in  STD_LOGIC_VECTOR (31 downto 0);
           cwp : out  STD_LOGIC;
           ncwp : in  STD_LOGIC;
           icc : out  STD_LOGIC_VECTOR (3 downto 0);
           nextpc : out  STD_LOGIC_VECTOR (31 downto 0);
           aluresult : out  STD_LOGIC_VECTOR (31 downto 0);
           Clkinext : in  STD_LOGIC;
           Resetext : in  STD_LOGIC
           	
		);
	END COMPONENT;	

COMPONENT Memory
	PORT(
			  a18in : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           datatomenout : out  STD_LOGIC_VECTOR (31 downto 0);
           wrenmenin : in  STD_LOGIC;
			  Resetext : in STD_LOGIC;
           aluresultout : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;


COMPONENT Writeback
	PORT(
			  datatomenin : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresultin : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsourcein : in  STD_LOGIC_VECTOR (1 downto 0);
           datatoreg : out  STD_LOGIC_VECTOR (31 downto 0)
           	
		);
	END COMPONENT;

signal a1,a2,a5,a9,a10,a18n,a16,a17,a20,a21,a22,a23,a60: std_logic_vector(31 downto 0);
signal a4,a13,a15: std_logic_vector(1 downto 0);
signal a8: std_logic_vector(3 downto 0);
signal a11: std_logic_vector(5 downto 0);
signal a6,a7,a14: std_logic;

begin ints_fetch: fetch PORT MAP(
	
			  Clk =>Clk,
           Reset =>reset,
           CUentrada =>a13,
           Entradain =>a60,
           Instruccionout =>a2,
           PCout =>a1
         
	);
	

ints_decode: Decode PORT MAP(
	
			  Instruction =>a2,
           posicionin =>a1,
           Regtomemin =>a23,
           cwpin =>a6,
			  iccin =>a8,
			  Resetext =>reset,
           ncwpout =>a7,
           callout =>a17, 
           ifout =>a16,
           rfsourceout =>a15,
           wrenmen =>a14,
           pcsource =>a13,
			  Cuentrada =>a4,
           aluop =>a11,
			  a18 =>a18n,
           crs1out =>a10,
           op2out =>a9
	);
	
ints_execute: Execute PORT MAP(
	
			  callin =>a17,
           ifin =>a16,
           pcsourcein =>a13,
           aluopin =>a11,
           op1in =>a10,
           op2in =>a9,
           cwp =>a6,
           ncwp =>a7,
           icc =>a8,
           nextpc =>a60,
           aluresult =>a20,
           Clkinext =>Clk,
           Resetext =>reset        
	);

ints_memory: Memory PORT MAP(
	
			  a18in=> a18n,
           aluresultin=> a20,
           datatomenout =>a21,
           wrenmenin =>a14,
			  Resetext  =>reset,
           aluresultout =>a22  
	);


ints_writeback: Writeback PORT MAP(
	
			  datatomenin =>a21,
           aluresultin =>a22,
           pc =>a1,
           rfsourcein =>a15,
           datatoreg =>a23
			  
	);
	
	Salidaunion<=a23;
	
end Behavioral;

