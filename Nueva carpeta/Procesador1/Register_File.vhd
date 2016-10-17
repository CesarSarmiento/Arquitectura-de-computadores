----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:05 10/17/2016 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Data_Writer : in  STD_LOGIC_VECTOR (31 downto 0);
           Rst : in  STD_LOGIC;
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_File;

architecture Behavioral of Register_File is
	type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal registros : ram_type :=(others => x"00000000");

begin
process(Rs1,Rs2, Data_Writer, Rst, Rd)
begin
	if(Rst = '1')then
				CRs1 <= (others=>'0');
				CRs2 <= (others=>'0');
			
				registros <= (others => x"00000000");
			else
				CRs1 <= registros(conv_integer(Rs1));
				CRs2 <= registros(conv_integer(Rs2));
				
				if(Rd  /= "000000")then
					registros(conv_integer(Rd)) <= Data_Writer;
				end if;
			end if;
	
end process; 
end Behavioral;

