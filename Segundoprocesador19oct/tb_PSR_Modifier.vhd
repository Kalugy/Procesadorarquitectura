--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_PSR_Modifier IS
END tb_PSR_Modifier;
 
ARCHITECTURE behavior OF tb_PSR_Modifier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_Modifier
    PORT(
         oper1 : IN  std_logic_vector(31 downto 0);
         oper2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(5 downto 0);
         aluResult : IN  std_logic_vector(31 downto 0);
         conditionalCodes : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal oper2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(5 downto 0) := (others => '0');
   signal aluResult : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal conditionalCodes : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_Modifier PORT MAP (
          oper1 => oper1,
          oper2 => oper2,
          aluop => aluop,
          aluResult => aluResult,
          conditionalCodes => conditionalCodes
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns. Para las instrucciones Logicas
      wait for 100 ns;	
		aluop<="010101";
		aluResult<="11111100000000000000000000000000";
		wait for 100 ns;	
		aluop<="010110";
		aluResult<="01111100000000000000000000000000";
		wait for 100 ns;	
		aluop<="010101";
		aluResult<="00000000000000000000000000000000";
		wait for 100 ns;	
		aluop<="111111";
		aluResult<="00000000000000000000000000000111";
		------------------------------------------------- para los ADDccs
		wait for 100 ns;	
		aluop<="010000";
		aluResult<="00000000000000000000000000000111";
		oper1<="00000000000000000001000000000111";
		oper2<="00000001000000000001000000000111";
		wait for 100 ns;	
		aluop<="010000";
		aluResult<="00000000000000000000000000000111";
		oper1<="10000000000000000001000000000111";
		oper2<="10000001000000000001000000000111";
		wait for 100 ns;	
		aluop<="010000";
		aluResult<="10000000000000000000000000000111";
		oper1<="11000000000000000001000000000111";
		oper2<="11000001000000000001000000000111";
		wait for 100 ns;	
		aluop<="010000";
		aluResult<="00000000000000000000000000000000";
		oper1<="11000000000000000001000000000111";
		oper2<="11000001000000000001000000000111";
		------------------------------------------------- para los SUBccs
		wait for 100 ns;	
		aluop<="010100";
		aluResult<="00000000000000000000000000000111";
		oper1<="00000000000000000001000000000111";
		oper2<="10000001000000000001000000000111";
		wait for 100 ns;	
		aluop<="010100";
		aluResult<="10000000000000000000000000000111";
		oper1<="00000000000000000001000000000111";
		oper2<="10000001000000000001000000000111";
		wait for 100 ns;	
		aluop<="011111";
		aluResult<="10000000000000000000000000000111";
		oper1<="11000000000000000001000000000111";
		oper2<="11000001000000000001000000000111";
      -- insert stimulus here 

      wait;
   end process;

END;
