--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:36 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/Kalugy/Documents/xilinx/Segundoprocesador/TbWindownmanager.vhd
-- Project Name:  Segundoprocesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WindowsManager
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
 
ENTITY TbWindownmanager IS
END TbWindownmanager;
 
ARCHITECTURE behavior OF TbWindownmanager IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WindowsManager
    PORT(
         cwp : IN  std_logic;
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         cwpout : OUT  std_logic;
         rs1out : OUT  std_logic_vector(5 downto 0);
         rs2out : OUT  std_logic_vector(5 downto 0);
         rdout : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cwp : std_logic := '0';
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal cwpout : std_logic;
   signal rs1out : std_logic_vector(5 downto 0);
   signal rs2out : std_logic_vector(5 downto 0);
   signal rdout : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WindowsManager PORT MAP (
          cwp => cwp,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          cwpout => cwpout,
          rs1out => rs1out,
          rs2out => rs2out,
          rdout => rdout
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		 wait for 50 ns;	
		cwp <= '0';
		rs1 <= "00000";
		rs2 <= "00000";
		rd <= "00000";
		op <= "00";
		op3 <= "000000";
		wait for 50 ns;	
		cwp <= '0';
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "10010";
		op <= "10";
		op3 <= "000000";
		wait for 50 ns;	
		cwp <= '1';
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "10010";
		op <= "10";
		op3 <= "111100";
		wait for 50 ns;	
		cwp <= '1';
		rs1 <= "01100";
		rs2 <= "01101";
		rd <= "00000";
		op <= "00";
		op3 <= "000000";
		wait for 50 ns;	
		cwp <= '1';
		rs1 <= "11000";
		rs2 <= "11001";
		rd <= "10010";
		op <= "10";
		op3 <= "000000";
		wait for 50 ns;

      

      -- insert stimulus here 

      wait;
   end process;

END;
