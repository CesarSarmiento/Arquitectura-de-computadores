--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:46:07 10/17/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Documents/GitHub/Arquitectura-de-computadores/Nueva carpeta/Procesador2/Test_MUX.vhd
-- Project Name:  Procesador2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
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
 
ENTITY Test_MUX IS
END Test_MUX;
 
ARCHITECTURE behavior OF Test_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         i : IN  std_logic;
         Dato_SEU : IN  std_logic_vector(31 downto 0);
         CRs2 : IN  std_logic_vector(31 downto 0);
         Out_MUX : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal Dato_SEU : std_logic_vector(31 downto 0) := (others => '0');
   signal CRs2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Out_MUX : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          i => i,
          Dato_SEU => Dato_SEU,
          CRs2 => CRs2,
          Out_MUX => Out_MUX
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin	
		i <='0';
		Dato_SEU <= x"00000004";
		CRs2 	<= x"00000008";
	
	wait;

   end process;

END;
