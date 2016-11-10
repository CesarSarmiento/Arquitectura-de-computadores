--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:33:46 10/17/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Documents/GitHub/Arquitectura-de-computadores/Nueva carpeta/Procesador1/Test_Unidad_Aritmetica.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unidad_Aritmetica
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
 
ENTITY Test_Unidad_Aritmetica IS
END Test_Unidad_Aritmetica;
 
ARCHITECTURE behavior OF Test_Unidad_Aritmetica IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unidad_Aritmetica
    PORT(
         CRs1 : IN  std_logic_vector(31 downto 0);
         CRs2 : IN  std_logic_vector(31 downto 0);
         Aluop : IN  std_logic_vector(5 downto 0);
			Carry : in  STD_LOGIC;
         Data_Writer : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal Carry : STD_LOGIC;
   signal CRs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal CRs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Aluop : std_logic_vector(5 downto 0) := (others => '0');
	

 	--Outputs
   signal Data_Writer : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unidad_Aritmetica PORT MAP (
          CRs1 => CRs1,
          CRs2 => CRs2,
          Aluop => Aluop,
			 Carry => Carry,
          Data_Writer => Data_Writer
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		CRs1 <= x"0000002A";
		CRs2 <= x"0000000F";
		Carry <= '1';
		 
      -- insert stimulus here 
		Aluop <= "000001";
		wait for 100 ns;
	
		Aluop <= "000010";
		wait for 100 ns;

     
      -- insert stimulus here 

      wait;
   end process;

END;
