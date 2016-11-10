----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:19:26 10/17/2016 
-- Design Name: 
-- Module Name:    Unidad_Control - Behavioral 
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

entity Unidad_Control is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end Unidad_Control;

architecture Behavioral of Unidad_Control is

begin
process(Op,Op3)
begin
if (Op= "10")then
			case Op3 is 
				
							when "000000" => -- ADD
								Aluop  <= "000001";
							when "010000" => -- ADDcc
								Aluop  <= "000010";
							when "001000" => -- ADDx
								Aluop  <= "000011";
							when "011000" => -- ADDxcc
								Aluop  <= "000100";
							when "000100" => -- SUB
								 Aluop <= "000101";
							when "010100" => -- SUBcc
								 Aluop <= "000110";
							when "001100" => -- SUBx
								 Aluop <= "000111";
							when "011100" => -- SUBxcc
								 Aluop <= "001000";
							when "000001" => -- AND
								Aluop <= "001001";
							when "010001" => -- ANDcc
								Aluop <= "001010";
							when "000101" => -- ANDN
								Aluop <= "001011";
							when "010101" => -- ANDNcc
								Aluop <= "001100";
							when "000010" => -- OR
								Aluop <= "001101";
							when "010010" => -- ORcc
								Aluop <= "001110";
							when "000110" => -- ORN
								Aluop <= "001111";
							when "010110" => -- ORNcc
								Aluop <= "010000";
							when "000011" => -- XOR
								Aluop  <= "010001";
							when "010011" => -- XORcc
								Aluop <= "010010";
							when "000111" => -- XORN
								Aluop <= "010011";
							when "010111" => -- XORNcc
								Aluop <= "010100";
							when "100101" => -- SLL
								Aluop <= "010101";
							when "100110" => -- SRL
								Aluop <= "010110";
							when "100111" => -- SRA
								Aluop <= "010111";
							when "111100" => -- SAVE
								Aluop <= "011000";
							when "111101" => -- RESTORE
								Aluop <= "011001";
								
							when others => -- El resto de funciones
								Aluop <= "111111";
							
						end case;
						 
		end if; 

end process; 


end Behavioral;

