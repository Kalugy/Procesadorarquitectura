--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:14:32 10/04/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/procesadordefinitivo/TBMUX32.vhd
-- Project Name:  procesadordefinitivo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX32
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TBMUX32 IS
END TBMUX32;
 
ARCHITECTURE behavior OF TBMUX32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX32
    PORT(
         SEUIMM : IN  std_logic_vector(31 downto 0);
         CRS2 : IN  std_logic_vector(31 downto 0);
         OPER2 : OUT  std_logic_vector(31 downto 0);
         Instruction : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SEUIMM : std_logic_vector(31 downto 0) := (others => '0');
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Instruction : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal OPER2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX32 PORT MAP (
          SEUIMM => SEUIMM,
          CRS2 => CRS2,
          OPER2 => OPER2,
          Instruction => Instruction
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Instruction <= "00000000000000000000000000000000";
		CRS2 <= "00000000000000000000000000000011";
		SEUIMM <= "11000000000000000000000000000011";
      wait for 100 ns;	

		Instruction <= "00000000000000000001000000000000";
		CRS2 <= "00000000000000000000000000000011";
		SEUIMM <= "11000000000000000000000000000011";
      wait for 100 ns;	
		Instruction <= "00000000000000000010000000000000";
		CRS2 <= "00000000000000000000000000000011";
		SEUIMM <= "11000000000000000000000000000011";
		
      wait for 100 ns;


      -- insert stimulus here 

      wait;
   end process;

END;
