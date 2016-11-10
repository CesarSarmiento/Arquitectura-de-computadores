--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:08:23 11/10/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Documents/GitHub/Arquitectura-de-computadores/Nueva carpeta/Procesador3ICC/Test_WinMan.vhd
-- Project Name:  Procesador3ICC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: WinMan
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_WinMan IS
END Test_WinMan;
 
ARCHITECTURE behavior OF Test_WinMan IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WinMan
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Cwp : IN  std_logic;
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         PRs1 : OUT  std_logic_vector(5 downto 0);
         PRs2 : OUT  std_logic_vector(5 downto 0);
         PRd : OUT  std_logic_vector(5 downto 0);
         NCwp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Cwp : std_logic := '0';
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal PRs1 : std_logic_vector(5 downto 0);
   signal PRs2 : std_logic_vector(5 downto 0);
   signal PRd : std_logic_vector(5 downto 0);
   signal NCwp : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WinMan PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Cwp => Cwp,
          Op => Op,
          Op3 => Op3,
          PRs1 => PRs1,
          PRs2 => PRs2,
          PRd => PRd,
          NCwp => NCwp
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
				Rs1 <= "10000";
				Rs2 <= "10001";
				Rd <= "10010";
				Cwp <= '0';
				Op <= "10";
				Op3 <="000000";
		
				wait for 20 ns;
		
				Cwp <= '1';
		
				wait for 20 ns;
		
				Rs1 <= "11000";
				Rs2 <= "11001";
				Rd <= "11010";
		
				wait for 20 ns;
      wait;
   end process;

END;
