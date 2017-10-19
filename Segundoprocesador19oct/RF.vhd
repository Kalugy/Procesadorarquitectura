----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity RF is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is

type ram_type is array (39 downto 0) of std_logic_vector (31 downto 0);
    signal RAM: ram_type;
begin
	 RAM(0)<= "00000000000000000000000000000000";
    process (rst,rd,rs1,rs2,dwr,RAM)
    begin
             if rst = '1' then
                RAM <= (others=>"00000000000000000000000000000000");
					 crs1 <="00000000000000000000000000000000";
					 crs2 <="00000000000000000000000000000000";
             elsif rd /= "000000" then 
					 RAM(conv_integer(rd)) <= dwr;
					 crs1 <= RAM(conv_integer(rs1));
					 crs2 <= RAM(conv_integer(rs2));
				 else 
                crs1 <= RAM(conv_integer(rs1));
					 crs2 <= RAM(conv_integer(rs2));
            end if;
    end process;

end Behavioral;

