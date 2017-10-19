--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:13:12 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/secondooooooooo/TbCUNEW.vhd
-- Project Name:  secondooooooooo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CU
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
 
ENTITY TbCUNEW IS
END TbCUNEW;
 
ARCHITECTURE behavior OF TbCUNEW IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         op3 : IN  std_logic_vector(5 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          op3 => op3,
          op => op,
          ALUOP => ALUOP
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		op <= "10";
		op3 <="000000";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000001";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000010";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000011";
		wait for 20 ns;
		
		op <= "10";
		op3 <="000111";
		wait for 20 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
