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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
			  Carry : in  STD_LOGIC;
           Data_Writer : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end Unidad_Aritmetica;

architecture Behavioral of Unidad_Aritmetica is

begin
process(CRs1, CRs2, Aluop)
begin
 case (Aluop) is 
			when "000001" => -- ADD
				Data_Writer <= CRs1 + CRs2;
			when "000010" => -- ADDcc
				Data_Writer <= CRs1 + CRs2;
			when "000011" => -- ADDx
				Data_Writer <= CRs1 + CRs2 + Carry;
			when "000100" => -- ADDxcc
				Data_Writer <= CRs1 + CRs2 + Carry;
			when "000101" => -- SUB
				Data_Writer <= CRs1 - CRs2;
			when "000110" => -- SUBcc
				Data_Writer <= CRs1 - CRs2;
			when "000111" => -- SUBx
				Data_Writer <= CRs1 - CRs2 - Carry;
			when "001000" => -- SUBxcc
				Data_Writer <= CRs1 - CRs2 - Carry;
			when "001001" => --AND
				Data_Writer <= CRs1 and CRs2;
			when "001010" => --ANDcc
				Data_Writer <= CRs1 and CRs2;
			when "001011" => --ANDN
				Data_Writer <= CRs1 nand CRs2;
			when "001100" => --ANDNcc
				Data_Writer <= CRs1 nand CRs2;
			when "001101" => -- OR
				Data_Writer <= CRs1 or CRs2;
			when "001110" => -- ORcc
				Data_Writer <= CRs1 or CRs2;
			when "001111" => -- ORN
				Data_Writer <= CRs1 nor CRs2;
			when "010000" => -- ORNcc
				Data_Writer <= CRs1 nor CRs2;
			when "010001" => -- XOR
				Data_Writer <= CRs1 xor CRs2;
			when "010010" => -- XORcc
				Data_Writer <= CRs1 xor CRs2;
			when "010011" => -- XORN
				Data_Writer <= CRs1 xnor CRs2;
			when "010100" => -- XORNcc
				Data_Writer <= CRs1 xnor CRs2;
			when others => -- Cae el nop
				Data_Writer <= (others=>'0');
		end case;
end process; 

end Behavioral;

