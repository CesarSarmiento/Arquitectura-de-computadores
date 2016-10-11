--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:37:07 10/10/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Desktop/universidad/arquitectura_de_computadores/Xilinx/Procesador_monociclo_sin_inmediato/Test_Adder.vhd
-- Project Name:  Procesador_monociclo_sin_inmediato
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Adder
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
 
ENTITY Test_Adder IS
END Test_Adder;
 
ARCHITECTURE behavior OF Test_Adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         Operador1 : IN  std_logic_vector(31 downto 0);
         Operador2 : IN  std_logic_vector(31 downto 0);
         ResultadoAdder : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Operador1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Operador2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal ResultadoAdder : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          Operador1 => Operador1,
          Operador2 => Operador2,
          ResultadoAdder => ResultadoAdder
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin
		Operador1 <= x"00000101";
		Operador2 <= x"00000001";
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Operador1 <= x"00001101";
		Operador2 <= x"00000001";		
      wait for 100 ns;
		Operador1 <= x"00000111";
		Operador2 <= x"00000001";

      -- insert stimulus here 

      wait;
   end process;

END;
