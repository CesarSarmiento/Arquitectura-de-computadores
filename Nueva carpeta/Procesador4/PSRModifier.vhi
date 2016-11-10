
-- VHDL Instantiation Created from source file PSRModifier.vhd -- 19:38:40 11/08/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSRModifier
	PORT(
		CRS1 : IN std_logic_vector(31 downto 0);
		CRS2 : IN std_logic_vector(31 downto 0);
		Rst : IN std_logic;
		Alu_op : IN std_logic_vector(5 downto 0);
		Resultado_alu : IN std_logic_vector(31 downto 0);          
		NZVC : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_PSRModifier: PSRModifier PORT MAP(
		CRS1 => ,
		CRS2 => ,
		Rst => ,
		Alu_op => ,
		Resultado_alu => ,
		NZVC => 
	);


