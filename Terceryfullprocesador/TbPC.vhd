--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:44:25 09/27/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/Procesador/TbPC.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY TbPC IS
END TbPC;
 
ARCHITECTURE behavior OF TbPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         inPC : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         outPC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inPC : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal outPC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          inPC => inPC,
          Reset => Reset,
          Clk => Clk,
          outPC => outPC
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
      
		Reset <= '0';
      inPC <= "00000000000000000000000000000000";
		
      wait for 100 ns;	
		
		Reset <= '0';
      inPC <= "00000000000000000000000000000001";
		
      wait for 100 ns;	
		
		Reset <= '1';
      inPC <= "00000000000000000000000000000000";
		
      wait for 100 ns;
		
		Reset <= '0';
      inPC <= "00000000000000000000000000000001";
		
      wait for 100 ns;
		
		Reset <= '0';
      inPC <= "00000000000000000000000000000011";
		
      wait for 100 ns;	
		Reset <= '0';
      inPC <= "00000000000000000000000000000111";
		
      wait for 100 ns;	
		Reset <= '0';
      inPC <= "00000000000000000000000000001111";
		
      wait for 100 ns;	
		Reset <= '0';
      inPC <= "00000000000000000000000000000001";
		
      wait for 100 ns;	


      -- insert stimulus here
      wait;
   end process;

END;
