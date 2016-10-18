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

							when "000100" => -- SUB
								 Aluop <= "000010";
								 
							when "000001" => -- AND
								Aluop <= "000011";
								 
							when "000101" => -- ANDN
								Aluop <= "000100";
								 
							when "000010" => -- OR
								Aluop <= "000101";
								
							when "000110" => -- ORN
								Aluop <= "000110";
								 
							when "000011" => -- XOR
								Aluop  <= "000111"; 
								
							when "000111" => -- XORN
								Aluop <= "001000";
								
							when others => -- El resto de funciones
								Aluop <= "111111";
							
						end case;
						 
		end if; 

end process; 


end Behavioral;

