--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_PSR IS
END tb_PSR;
 
ARCHITECTURE behavior OF tb_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         nzvc : IN  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal c : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          nzvc => nzvc,
          c => c
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		nzvc<="1111";
		wait for 100 ns;	
		nzvc<="1100";
		wait for 100 ns;	
		nzvc<="1101";

      -- insert stimulus here 

      wait;
   end process;

END;