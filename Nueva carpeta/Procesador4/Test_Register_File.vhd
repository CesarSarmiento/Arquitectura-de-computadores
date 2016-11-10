--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:08:08 10/17/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Documents/GitHub/Arquitectura-de-computadores/Nueva carpeta/Procesador1/Test_Register_File.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY Test_Register_File IS
END Test_Register_File;
 
ARCHITECTURE behavior OF Test_Register_File IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         Rs1 : IN  std_logic_vector(5 downto 0);
         Rs2 : IN  std_logic_vector(5 downto 0);
         Data_Writer : IN  std_logic_vector(31 downto 0);
         Rst : IN  std_logic;
         Rd : IN  std_logic_vector(5 downto 0);
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal Data_Writer : std_logic_vector(31 downto 0) := (others => '0');
   signal Rst : std_logic := '0';
   signal Rd : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Data_Writer => Data_Writer,
          Rst => Rst,
          Rd => Rd,
          CRs1 => CRs1,
          CRs2 => CRs2
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Rst <= '1';
		wait for 100 ns;	
		Rst <='0';
		Rs1 <= "101000";
		Rs2 <= "101010";
		Rd <= "001000";
		Data_Writer  <= "00000000000000100000000000010011";
		wait for 100 ns;
		Rst <='0';
      -- insert stimulus here 

      wait;
   end process;

END;
