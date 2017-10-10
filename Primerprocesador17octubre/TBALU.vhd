--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:28:34 10/04/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/procesadordefinitivo/TBALU.vhd
-- Project Name:  procesadordefinitivo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY TBALU IS
END TBALU;
 
ARCHITECTURE behavior OF TBALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         OPER1 : IN  std_logic_vector(31 downto 0);
         OPER2 : IN  std_logic_vector(31 downto 0);
         ALURESULT : OUT  std_logic_vector(31 downto 0);
         ALUOP : IN  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OPER1 : std_logic_vector(31 downto 0) := (others => '0');
   signal OPER2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUOP : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALURESULT : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          OPER1 => OPER1,
          OPER2 => OPER2,
          ALURESULT => ALURESULT,
          ALUOP => ALUOP
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      OPER1 <= "00000000000000000000000000000000";
		OPER2 <= "00000000000000000000000000000011";
		ALUOP <= "000000";
      wait for 100 ns;	

		OPER1 <= "00000000000000000000000000000011";
		OPER2 <= "00000000000000000000000000000011";
		ALUOP <= "000000";
      wait for 100 ns;	
		OPER1 <= "00000000000000000000000000000000";
		OPER2 <= "00000000000000000000000000000011";
		ALUOP <= "000010";
      wait for 100 ns;	
		OPER1 <= "00000000000000000000000000000011";
		OPER2 <= "00000000000000000000000000000011";
		ALUOP <= "000100";
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
