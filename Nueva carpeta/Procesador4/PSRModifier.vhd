----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:33:18 11/08/2016 
-- Design Name: 
-- Module Name:    PSRModifier - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSRModifier is
    Port ( CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Rst : in  STD_LOGIC;
           Alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           Resultado_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRModifier;

architecture Behavioral of PSRModifier is

begin
		process (Rst, Alu_op, Resultado_alu, CRS1, CRS2)
		begin
			if Rst = '1' then 
				NZVC <= "0000";
			else	
				if Alu_op = "001010" or Alu_op = "001100" or Alu_op = "001110" or Alu_op = "010000" or Alu_op = "010010" or Alu_op = "010100" then 
					NZVC(0) <= Resultado_alu(31);
					if Resultado_alu = "00000000000000000000000000000000" then 
						NZVC(1) <= '1';
					else
						NZVC(1) <= '0';
					end if;
					NZVC(2) <= '0';
					NZVC(3) <= '0';
				end if;
				
				
				if Alu_op = "000010" or Alu_op = "000100" then
					NZVC(0) <= Resultado_alu(31);
					if Resultado_alu = "00000000000000000000000000000000" then 
						NZVC(1) <= '1';
					else
						NZVC(1) <= '0';
					end if;
					NZVC(2) <= (CRS1(31) and CRS2(31) and (not Resultado_alu(31))) or ((not CRS1(31)) and (not CRS2(31)) and Resultado_alu(31));
					NZVC(3) <= (CRS1(31) and CRS2(31)) or ((not Resultado_alu(31)) and (CRS1(31) or CRS2(31)));
				end if;

				if Alu_op = "000110" or Alu_op = "001000" then
					NZVC(0) <= Resultado_alu(31);
					if Resultado_alu = "00000000000000000000000000000000" then 
						NZVC(1) <= '1';
					else
						NZVC(1) <= '0';
					end if;
					NZVC(2) <= (CRS1(31) and (not CRS2(31)) and (not Resultado_alu(31))) or ((not CRS1(31)) and CRS2(31) and Resultado_alu(31));
					NZVC(3) <= ((not CRS1(31)) and CRS2(31)) or (Resultado_alu(31) and ((not CRS1(31)) or CRS2(31)));
				end if;
				
			end if;
	end process;


end Behavioral;

