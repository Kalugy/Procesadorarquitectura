--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:59:22 10/04/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/procesadordefinitivo/TBSEU.vhd
-- Project Name:  procesadordefinitivo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU
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
 
ENTITY TBSEU IS
END TBSEU;
 
ARCHITECTURE behavior OF TBSEU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         Instruction : IN  std_logic_vector(31 downto 0);
         OUTSEU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Instruction : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal OUTSEU : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          Instruction => Instruction,
          OUTSEU => OUTSEU
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Instruction <= "00000000000000000000000000000111";
		
      wait for 100 ns;	

		Instruction <= "00001000000000000000000000011100";
		
      wait for 100 ns;	
		Instruction <= "00000000100000000011111111111111";
		
      wait for 100 ns;	
		Instruction <= "00001111100000000000000000000000";
		
      wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
