----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:19 11/10/2016 
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
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rd : in  STD_LOGIC_VECTOR (4 downto 0);
           Cwp : in  STD_LOGIC;
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           PRs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           PRs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           PRd : out  STD_LOGIC_VECTOR (5 downto 0);
           NCwp : out  STD_LOGIC);
end WinMan;

architecture Behavioral of WinMan is
	signal Rs1int,Rs2int,Rdint: integer range 0 to 39 := 0;
	signal Cocwp : integer := conv_integer(Cwp);

begin

				process(Rs1,Rs2,Rd,Cwp,Op,Op3,Rs1int,Rs2int,Rdint)
					begin
								if(Op = "10" and Op3 = "011000")then--SAVE
										if Cwp = '1' then
											NCwp <= '1';
											Cocwp <= 0;
										else
											NCwp <= '0';
											Cocwp <= 1;
										end if;
								else
										if(Op = "10" and Op3 = "011001")then--RESTORE
											if Cwp = '1' then
												NCwp <= '0';
												Cocwp <= 0;
											else
												NCwp <= '1';
												Cocwp <= 1;
											end if;
										end if;
								end if;
							
								if(Rs1>="00000" and Rs1<="00111") then --Globales
									Rs1int <= conv_integer(Rs1);
								else
										if(Rs1>="11000" and Rs1<="11111") then --Entrada
											Rs1int <= conv_integer(Rs1)-(conv_integer(Cocwp)*16);
										else
												if(Rs1>="10000" and Rs1<="10111") then --Locales
													Rs1int <= conv_integer(Rs1)+(conv_integer(Cocwp)*16);
												else
														if(Rs1>="01000" and Rs1<="01111") then --Salida
															Rs1int <= conv_integer(Rs1)+ (conv_integer(Cocwp)*16);
														end if;
												end if;
										end if;
								end if;
							
							
						
								if(Rs2>="00000" and Rs2<="00111") then --Globales
									Rs2int <= conv_integer(Rs2);
								else
										if(Rs2>="11000" and Rs2<="11111") then
											Rs2int <= conv_integer(Rs2) - (conv_integer(Cocwp)*16); --Entrada
										else
												if(Rs2>="10000" and Rs2<="10111") then
													Rs2int <= conv_integer(Rs2)+ (conv_integer(Cocwp)*16); --Locales
												else
														if(Rs2>="01000" and Rs2<="01111") then
															Rs2int <= conv_integer(Rs2)+ (conv_integer(Cocwp)*16); --Salida
														end if;
												end if;
										end if;
								end if;
								
							
								if(Rd>="00000" and Rd<="00111") then --Globales
									Rdint <= conv_integer(Rd);
								else
										if(Rd>="11000" and Rd<="11111") then --Entrada
											Rdint <= conv_integer(Rd)  - (conv_integer(Cocwp)*16);
										else
												if(Rd>="10000" and Rd<="10111") then --Locales
													Rdint <= conv_integer(Rd)+ (conv_integer(Cocwp)*16);
												else
														if(Rd>="01000" and Rd<="01111") then --Salida
															Rdint <= conv_integer(Rd)+ (conv_integer(Cocwp)*16);
														end if;
												end if;
										end if;
								end if; 
					end process;
	
					PRs1 <= conv_std_logic_vector(Rs1int, 6);
					PRs2 <= conv_std_logic_vector(rs2int, 6);
					PRd <= conv_std_logic_vector(rdint, 6);

end Behavioral;

