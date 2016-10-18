
-- VHDL Instantiation Created from source file Next_Program_Counter.vhd -- 17:10:49 10/17/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Next_Program_Counter
	PORT(
		Clk : IN std_logic;
		Rst : IN std_logic;
		In_Next : IN std_logic_vector(31 downto 0);          
		Out_Next : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Next_Program_Counter: Next_Program_Counter PORT MAP(
		Clk => ,
		Rst => ,
		In_Next => ,
		Out_Next => 
	);


