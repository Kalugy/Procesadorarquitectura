--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:28:33 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/secondooooooooo/Tbfirstpartnew.vhd
-- Project Name:  secondooooooooo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: firstrpart
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
 
ENTITY Tbfirstpartnew IS
END Tbfirstpartnew;
 
ARCHITECTURE behavior OF Tbfirstpartnew IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT firstrpart
    PORT(
         Resetext : IN  std_logic;
         Clkinext : IN  std_logic;
         Adressext : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Resetext : std_logic := '0';
   signal Clkinext : std_logic := '0';

 	--Outputs
   signal Adressext : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clkinext_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: firstrpart PORT MAP (
          Resetext => Resetext,
          Clkinext => Clkinext,
          Adressext => Adressext
        );

   -- Clock process definitions
   Clkinext_process :process
   begin
		Clkinext <= '0';
		wait for Clkinext_period/2;
		Clkinext <= '1';
		wait for Clkinext_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Resetext <= '0';
      wait for 100 ns;
		
		Resetext <= '1';
      wait for 100 ns;	

      Resetext <= '0';
      wait for 100 ns;	
		
		Resetext <= '0';
      wait for 100 ns;	
		
		Resetext <= '0';
      wait for 100 ns;	
		
		Resetext <= '0';
      wait for 100 ns;	
		
		Resetext <= '0';
      wait for 100 ns;	
		
		Resetext <= '0';
      wait for 100 ns;
		
		Resetext <= '0';
      wait for 100 ns;	
		
		Resetext <= '0';
      wait for 100 ns;	
		
		Resetext <= '0';
      wait for 100 ns;	


      -- insert stimulus here 


      -- insert stimulus here 

      wait;
   end process;

END;
