--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:34:21 11/08/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Documents/GitHub/Arquitectura-de-computadores/Nueva carpeta/Procesador3ICC/Test_PSRModifier.vhd
-- Project Name:  Procesador3ICC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSRModifier
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
 
ENTITY Test_PSRModifier IS
END Test_PSRModifier;
 
ARCHITECTURE behavior OF Test_PSRModifier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRModifier
    PORT(
         CRS1 : IN  std_logic_vector(31 downto 0);
         CRS2 : IN  std_logic_vector(31 downto 0);
         Rst : IN  std_logic;
         Alu_op : IN  std_logic_vector(5 downto 0);
         Resultado_alu : IN  std_logic_vector(31 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Rst : std_logic := '0';
   signal Alu_op : std_logic_vector(5 downto 0) := (others => '0');
   signal Resultado_alu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRModifier PORT MAP (
          CRS1 => CRS1,
          CRS2 => CRS2,
          Rst => Rst,
          Alu_op => Alu_op,
          Resultado_alu => Resultado_alu,
          NZVC => NZVC
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
				Resultado_alu <= x"00000000";
				CRS1 <= "00000000000000000000000000000001";
				CRS2 <= "00000000000000000000000000000001";
				Alu_op <= "001100";
      wait for 100 ns;	
				Resultado_alu <= x"0000000F";
				CRS1 <= "00000000000000000000000000000001";
				CRS2 <= "00000000000000000000000000000000";
				Alu_op <= "010100";
				wait for 100 ns;
				Resultado_alu <= x"F000010F";
				CRS1 <= "00000000000000000000000000000000";
				CRS2 <= "00000000000000000000000000000001";
				Alu_op <= "010000";
			

      wait;
   end process;

END;
