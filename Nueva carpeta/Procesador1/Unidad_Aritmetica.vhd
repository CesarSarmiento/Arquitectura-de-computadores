----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:00 10/17/2016 
-- Design Name: 
-- Module Name:    Unidad_Aritmetica - Behavioral 
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

entity Unidad_Aritmetica is
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           Data_Writer : out  STD_LOGIC_VECTOR (31 downto 0));
end Unidad_Aritmetica;

architecture Behavioral of Unidad_Aritmetica is

begin
process(CRs1, CRs2, Aluop)
begin
 case (Aluop) is 
			when "000001" => -- add
				Data_Writer <= CRs1 + CRs2;
			when "000010" => -- sub
				Data_Writer <= CRs1 - CRs2;
			when "000011" => --and
				Data_Writer <= CRs1 and CRs2;
			when "000100" => --andn
				Data_Writer <= CRs1 nand CRs2;
			when "000101" => -- or
				Data_Writer <= CRs1 or CRs2;
			when "000110" => -- orn
				Data_Writer <= CRs1 nor CRs2;
			when "000111" => -- xor
				Data_Writer <= CRs1 xor CRs2;
			when "001000" => -- xorn
				Data_Writer <= CRs1 xnor CRs2;
			when others => -- Cae el nop
				Data_Writer <= (others=>'0');
		end case;
end process; 

end Behavioral;

