--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:22:34 12/02/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/jummmmmmmm/tbfetchhhh.vhd
-- Project Name:  jummmmmmmm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fetch
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
 
ENTITY tbfetchhhh IS
END tbfetchhhh;
 
ARCHITECTURE behavior OF tbfetchhhh IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fetch
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         CUentrada : IN  std_logic_vector(1 downto 0);
         Entradain : IN  std_logic_vector(31 downto 0);
         Instruccionout : OUT  std_logic_vector(31 downto 0);
         PCout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal CUentrada : std_logic_vector(1 downto 0) := (others => '0');
   signal Entradain : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Instruccionout : std_logic_vector(31 downto 0);
   signal PCout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fetch PORT MAP (
          Clk => Clk,
          Reset => Reset,
          CUentrada => CUentrada,
          Entradain => Entradain,
          Instruccionout => Instruccionout,
          PCout => PCout
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
      Reset <= '0';
      CUentrada <= "10";
      Entradain <=  "00000000000000000000000000000101";
      wait for 100 ns;	
		Reset <= '1';
      CUentrada <= "10";
      Entradain <=  "00000000000000000000000000000101";
      wait for 100 ns;	
		Reset <= '0';
      CUentrada <= "10";
      Entradain <=  "00000000000000000000000000000101";
      wait for 100 ns;	
		Reset <= '0';
      CUentrada <= "10";
      Entradain <=  "00000000000000000000000000000101";
      wait for 100 ns;	
		Reset <= '0';
      CUentrada <= "10";
      Entradain <=  "00000000000000000000000000000000";
      wait for 100 ns;	
		Reset <= '0';
      CUentrada <= "10";
      Entradain <=  "00000000000000000000000000000001";
      wait for 100 ns;	

      wait;
   end process;

END;
