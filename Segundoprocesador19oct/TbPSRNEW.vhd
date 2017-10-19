--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:06:56 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/secondooooooooo/TbPSRNEW.vhd
-- Project Name:  secondooooooooo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
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
 
ENTITY TbPSRNEW IS
END TbPSRNEW;
 
ARCHITECTURE behavior OF TbPSRNEW IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         nzvc : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         cwp : OUT  std_logic;
         ncwp : IN  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal ncwp : std_logic := '0';

 	--Outputs
   signal cwp : std_logic;
   signal c : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          nzvc => nzvc,
          clk => clk,
          cwp => cwp,
          ncwp => ncwp,
          c => c
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		-- hold reset state for 100 ns.
      wait for 100 ns;	
		nzvc<="1111";
		ncwp<='0';
		wait for 100 ns;	
		nzvc<="1100";
		ncwp<='1';
		wait for 100 ns;	
		nzvc<="1101";
		ncwp<='0';
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
