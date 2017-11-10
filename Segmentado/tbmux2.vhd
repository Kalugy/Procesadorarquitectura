--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:26:50 11/09/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/segmentado1intento/tbmux2.vhd
-- Project Name:  segmentado1intento
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux2
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
 
ENTITY tbmux2 IS
END tbmux2;
 
ARCHITECTURE behavior OF tbmux2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux2
    PORT(
         Entrada : IN  std_logic_vector(31 downto 0);
         sumador : IN  std_logic_vector(31 downto 0);
         Cuentrada : IN  std_logic;
         posicion : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada : std_logic_vector(31 downto 0) := (others => '0');
   signal sumador : std_logic_vector(31 downto 0) := (others => '0');
   signal Cuentrada : std_logic := '0';

 	--Outputs
   signal posicion : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux2 PORT MAP (
          Entrada => Entrada,
          sumador => sumador,
          Cuentrada => Cuentrada,
          posicion => posicion
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin	
		wait for 100 ns;
		Entrada <= "00000000000000000000000000000001";
      sumador <= "00000000000000000000000000000000";
      Cuentrada <= '0';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Entrada <= "00000000000000000000000000000001";
      sumador <= "00000000000000000000000000000000";
      Cuentrada <= '1';
		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
