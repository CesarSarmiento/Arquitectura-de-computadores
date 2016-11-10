--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:36:46 10/07/2016
-- Design Name:   
-- Module Name:   C:/Users/Cesar/Desktop/universidad/arquitectura_de_computadores/Xilinx/Procesador_monociclo_sin_inmediato/Test_Next_PC.vhd
-- Project Name:  Procesador_monociclo_sin_inmediato
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Next_Program_Counter
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
 
ENTITY Test_Next_PC IS
END Test_Next_PC;
 
ARCHITECTURE behavior OF Test_Next_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Next_Program_Counter
    PORT(
         Clk : IN  std_logic;
         Rst : IN  std_logic;
         In_Next : IN  std_logic_vector(31 downto 0);
         Out_Next : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';
   signal In_Next : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Out_Next : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Next_Program_Counter PORT MAP (
          Clk => Clk,
          Rst => Rst,
          In_Next => In_Next,
          Out_Next => Out_Next
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Rst <= '1';
      wait for 100 ns;	
		Rst <= '0';
		In_Next <= "00000000000000000000000000000001";
      wait for 100 ns;	
		In_Next <= "00000000001000000000000000000001";
		wait for 100 ns;	
		In_Next <= "00000000001000000000001000000001";
		wait for 100 ns;	
		In_Next <= "00000000001000000000000000000101";
		wait for 100 ns;	
		In_Next <= "00000000001000000000000000000011";


      -- insert stimulus here 

      wait;
   end process;

END;
