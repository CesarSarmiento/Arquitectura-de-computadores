----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:47 10/17/2016 
-- Design Name: 
-- Module Name:    Procesador_Sin_Inmediato - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Procesador_Sin_Inmediato is
    Port ( Rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Resultado_Procesador : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador_Sin_Inmediato;

architecture Behavioral of Procesador_Sin_Inmediato is
	COMPONENT Adder
		PORT(
			Operador1 : IN std_logic_vector(31 downto 0);
			Operador2 : IN std_logic_vector(31 downto 0);          
			ResultadoAdder : OUT std_logic_vector(31 downto 0)
			);
	END COMPONENT;

	COMPONENT Next_Program_Counter
		PORT(
			Clk : IN std_logic;
			Rst : IN std_logic;
			In_Next : IN std_logic_vector(31 downto 0);          
			Out_Next : OUT std_logic_vector(31 downto 0)
			);
	END COMPONENT;

	COMPONENT InstructionMemory
		PORT(
			DireccionInstr : IN std_logic_vector(31 downto 0);
			Rst : IN std_logic;          
			InstruccionSIM : OUT std_logic_vector(31 downto 0)
			);
	END COMPONENT;

	COMPONENT Unidad_Control
		PORT(
			Op : IN std_logic_vector(1 downto 0);
			Op3 : IN std_logic_vector(5 downto 0);          
			Aluop : OUT std_logic_vector(5 downto 0)
			);
	END COMPONENT;

	COMPONENT Register_File
		PORT(
			Rs1 : IN std_logic_vector(4 downto 0);
			Rs2 : IN std_logic_vector(4 downto 0);
			Data_Writer : IN std_logic_vector(31 downto 0);
			Rst : IN std_logic;
			Rd : IN std_logic_vector(4 downto 0);          
			CRs1 : OUT std_logic_vector(31 downto 0);
			CRs2 : OUT std_logic_vector(31 downto 0)
			);
	END COMPONENT;

	COMPONENT Unidad_Aritmetica
		PORT(
			CRs1 : IN std_logic_vector(31 downto 0);
			CRs2 : IN std_logic_vector(31 downto 0);
			Aluop : IN std_logic_vector(5 downto 0);          
			Data_Writer : OUT std_logic_vector(31 downto 0)
			);
	END COMPONENT;


signal AdderToNPC,PCToAdder, PCToIM, IMToUR, AluToRF, RFToALU1, RFToALU2:STD_LOGIC_VECTOR (31 downto 0);
signal Alu_Op:STD_LOGIC_VECTOR (5 downto 0);
begin

	Inst_Adder: Adder PORT MAP(
			Operador1 => x"00000001" ,
			Operador2 => PCToAdder,
			ResultadoAdder => AdderToNPC
	);

	Inst_Next_Program_Counter: Next_Program_Counter PORT MAP(
			Clk => Clk,
			Rst => Rst,
			In_Next =>AdderToNPC ,
			Out_Next =>PCToAdder
	);

	Inst_ProgCounter: Next_Program_Counter PORT MAP(
			Clk => Clk,
			Rst => Rst,
			In_Next =>PCToAdder ,
			Out_Next =>PCToIM 
	);

	Inst_InstructionMemory: InstructionMemory PORT MAP(
			DireccionInstr =>PCToIM  ,
			InstruccionSIM =>IMToUR ,
			Rst => Rst
	);

	Inst_Unidad_Control: Unidad_Control PORT MAP(
			Op =>IMToUR(31 downto 30) ,
			Op3 =>IMToUR(24 downto 19),
			Aluop => Alu_Op
	);

	Inst_Register_File: Register_File PORT MAP(
			Rs1 =>IMToUR(18 downto 14),
			Rs2 =>IMToUR(4 downto 0),
			Data_Writer => AluToRF,
			Rst => Rst,
			Rd =>IMToUR(29 downto 25) ,
			CRs1 => RFToALU1,
			CRs2 => RFToALU2
	);

	Inst_Unidad_Aritmetica: Unidad_Aritmetica PORT MAP(
			CRs1 => RFToALU1,
			CRs2 => RFToALU2,
			Aluop => Alu_Op,
			Data_Writer => AluToRF
		);
		
	Resultado_Procesador <= AluToRF;
end Behavioral;

