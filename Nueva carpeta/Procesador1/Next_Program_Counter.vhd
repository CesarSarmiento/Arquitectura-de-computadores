----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:33:26 10/07/2016 
-- Design Name: 
-- Module Name:    Next_Program_Counter - Behavioral 
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

entity Next_Program_Counter is
    Port ( Clk : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           In_Next : in  STD_LOGIC_VECTOR (31 downto 0);
           Out_Next : out  STD_LOGIC_VECTOR (31 downto 0));
end Next_Program_Counter;

architecture Behavioral of Next_Program_Counter is

begin
	process(Clk, Rst,In_Next)
	begin 
		if(rising_edge(Clk))then 
			if(Rst='1')then
				 Out_Next <= (others =>'0');
			 else 
				Out_Next <= In_Next; 
		end if;
	end if;
end process;

end Behavioral;

