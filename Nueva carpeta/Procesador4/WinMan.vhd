----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:17:04 11/10/2016 
-- Design Name: 
-- Module Name:    WinMan - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WinMan is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC;
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out  STD_LOGIC);
end WinMan;

architecture Behavioral of WinMan is
	signal rs1int,rs2int,rdint: integer range 0 to 39 := 0;
	signal cocwp : integer := conv_integer(cwp);

begin

	process(rs1,rs2,rd,cwp,op,op3,rs1int,rs2int,rdint)
	begin
				if(op = "10" and op3 = "011000")then--SAVE
						if cwp = '1' then
							ncwp <= '1';
							cocwp <= 0;
						else
							ncwp <= '0';
							cocwp <= 1;
						end if;
				else
						if(op = "10" and op3 = "011001")then--RESTORE
								if cwp = '1' then
									ncwp <= '0';
									cocwp <= 0;
								else
									ncwp <= '1';
									cocwp <= 1;
								end if;
						end if;
				end if;
			
				if(rs1>="00000" and rs1<="00111") then --Globales
					rs1int <= conv_integer(rs1);
				else
						if(rs1>="11000" and rs1<="11111") then --Entrada
							rs1int <= conv_integer(rs1)-(conv_integer(cocwp)*16);
						else
									if(rs1>="10000" and rs1<="10111") then --Locales
										rs1int <= conv_integer(rs1)+(conv_integer(cocwp)*16);
									else
										if(rs1>="01000" and rs1<="01111") then --Salida
											rs1int <= conv_integer(rs1)+ (conv_integer(cocwp)*16);
										end if;
								end if;
						end if;
				end if;
			
				if(rs2>="00000" and rs2<="00111") then --Globales
					rs2int <= conv_integer(rs2);
				else
					if(rs2>="11000" and rs2<="11111") then
						rs2int <= conv_integer(rs2) - (conv_integer(cocwp)*16); --Entrada
					else
							if(rs2>="10000" and rs2<="10111") then
								rs2int <= conv_integer(rs2)+ (conv_integer(cocwp)*16); --Locales
							else
									if(rs2>="01000" and rs2<="01111") then
										rs2int <= conv_integer(rs2)+ (conv_integer(cocwp)*16); --Salida
									end if;
							end if;
					end if;
				end if;
			
				if(rd>="00000" and rd<="00111") then --Globales
					rdint <= conv_integer(rd);
				else
						if(rd>="11000" and rd<="11111") then --Entrada
							rdint <= conv_integer(rd)  - (conv_integer(cocwp)*16);
						else
								if(rd>="10000" and rd<="10111") then --Locales
									rdint <= conv_integer(rd)+ (conv_integer(cocwp)*16);
								else
										if(rd>="01000" and rd<="01111") then --Salida
											rdint <= conv_integer(rd)+ (conv_integer(cocwp)*16);
										end if;
								end if;
						end if;
				end if;  
	end process;
	
	nrs1 <= conv_std_logic_vector(rs1int, 6);
	nrs2 <= conv_std_logic_vector(rs2int, 6);
	nrd <= conv_std_logic_vector(rdint, 6);


end Behavioral;

