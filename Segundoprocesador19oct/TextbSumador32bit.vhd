--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:33:50 09/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/Procesador/TextbSumador32bit.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador32bit
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
 
ENTITY TextbSumador32bit IS
END TextbSumador32bit;
 
ARCHITECTURE behavior OF TextbSumador32bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador32bit
    PORT(
         Oper1 : IN  std_logic_vector(31 downto 0);
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Oper1 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador32bit PORT MAP (
          Oper1 => Oper1,
          Result => Result
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		Oper1 <= "00000000000000000000000000000001";
		
      wait for 100 ns;	
		
		Oper1 <= "00000000000000000000000000000000";
		
      wait for 100 ns;

		Oper1 <= "00000000000000000000000000000100";
		
      wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
