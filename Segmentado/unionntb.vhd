--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:59:24 12/02/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/jummmmmmmm/unionntb.vhd
-- Project Name:  jummmmmmmm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Union
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
 
ENTITY unionntb IS
END unionntb;
 
ARCHITECTURE behavior OF unionntb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Union
    PORT(
         Clk : IN  std_logic;
         reset : IN  std_logic;
         Salidaunion : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Salidaunion : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Union PORT MAP (
          Clk => Clk,
          reset => reset,
          Salidaunion => Salidaunion
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
		wait for 15 ns;
		reset <= '0';
		wait for 15 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
