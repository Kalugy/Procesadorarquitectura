--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:10 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/Segundoprocesador/TbEFNEW.vhd
-- Project Name:  Segundoprocesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RF
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
 
ENTITY TbEFNEW IS
END TbEFNEW;
 
ARCHITECTURE behavior OF TbEFNEW IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         rs1 : IN  std_logic_vector(5 downto 0);
         rs2 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(5 downto 0);
         dwr : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          dwr => dwr,
          rst => rst,
          crs1 => crs1,
          crs2 => crs2
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		rs1<="000001";
		rs2<="000000";
		rd<="000010";
		dwr<="00010000000000011100000000000000";
		rst<='1';
      wait for 200 ns;
		rs1<="000010";
		rs2<="000000";
		rd<="000001";
		dwr<="00010000000000000000000000000111";
		rst<='0';
      wait for 200 ns;
		rs1<="000001";
		rs2<="000000";
		rd<="010000";
		dwr<="00010000000000000000000000000000";
		rst<='0';
		wait for 200 ns;
		rs1<="000000";
		rs2<="000100";
		rd<="000100";
		dwr<="00010000000000000000000000000000";
		rst<='0';
		wait for 200 ns;
		rs1<="000001";
		rs2<="000100";
		rd<="000011";
		dwr<="00010000000000000000000000000001";
		rst<='0';
		wait for 200 ns;
		rs1<="000001";
		rs2<="000100";
		rd<="000011";
		dwr<="00010000000000000000000000000001";
		rst<='1';
		wait for 200 ns;
		rs1<="000001";
		rs2<="010000";
		rd<="000011";
		dwr<="00010000000000000000000000000001";
		rst<='0';
		wait for 200 ns;
		rs1<="000100";
		rs2<="000011";
		rd<="000000";
		dwr<="00010000000000000000000000000001";
		rst<='0';
      -- insert stimulus here 

     

      -- insert stimulus here 

      wait;
   end process;

END;
