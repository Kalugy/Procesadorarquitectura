--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:51:54 09/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/Procesador/TBIM.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IM
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
 
ENTITY TBIM IS
END TBIM;
 
ARCHITECTURE behavior OF TBIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';

 	--Outputs
   signal Instruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          Address => Address,
          Reset => Reset,
          Instruction => Instruction
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Address <= "00000000000000000000000000000000";
		Reset <= '1';
		
      wait for 100 ns;	
		
		Address <= "00000000000000000000000000000000";
		Reset <= '0';
		
      wait for 100 ns;	
		
		Address <= "00000000000000000000000000000001";
		Reset <= '0';
		
      wait for 100 ns;	


		


      

      -- insert stimulus here 

      wait;
   end process;

END;
