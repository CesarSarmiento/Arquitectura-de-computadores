--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:22:58 10/11/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Documents/GitHub/Arquitectura-de-computadores/Nueva carpeta/Procesador1/Test_Instruction_Memory.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InstructionMemory
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
 
ENTITY Test_Instruction_Memory IS
END Test_Instruction_Memory;
 
ARCHITECTURE behavior OF Test_Instruction_Memory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMemory
    PORT(
         DireccionInstr : IN  std_logic_vector(31 downto 0);
         InstruccionSIM : OUT  std_logic_vector(31 downto 0);
         Rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal DireccionInstr : std_logic_vector(31 downto 0) := (others => '0');
   signal Rst : std_logic := '0';

 	--Outputs
   signal InstruccionSIM : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMemory PORT MAP (
          DireccionInstr => DireccionInstr,
          InstruccionSIM => InstruccionSIM,
          Rst => Rst
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
				Rst <='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
				Rst <='0';
				DireccionInstr <= "00000000000000000000000000000000";

      

      -- insert stimulus here 

      wait;
   end process;

END;
