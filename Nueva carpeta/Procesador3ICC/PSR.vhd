----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:36:51 11/08/2016 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
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

entity PSR is
    Port ( NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           Rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Carry : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin
		process(Rst, Clk, NZVC)
		begin
			if (Rst = '1') then 		
				Carry <= '0';
			elsif (rising_edge(Clk)) then
				Carry <= NZVC(0);
				
		end if;
		end process;


end Behavioral;

