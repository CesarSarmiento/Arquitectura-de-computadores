--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:25:37 10/17/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Documents/GitHub/Arquitectura-de-computadores/Nueva carpeta/Procesador1/Test_Unidad_Control.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unidad_Control
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
 
ENTITY Test_Unidad_Control IS
END Test_Unidad_Control;
 
ARCHITECTURE behavior OF Test_Unidad_Control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unidad_Control
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         Aluop : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Aluop : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unidad_Control PORT MAP (
          Op => Op,
          Op3 => Op3,
          Aluop => Aluop
        );

   -- Clock process definitions
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      	
		op <= "10";
		op3<="111100";

      -- insert stimulus here 

      wait;
   end process;

END;
