library ieee;
use ieee.std_logic_1164.all;

entity memoria is
port(
	entrada:	in  std_logic_vector(2 downto 0);
	liga:			out std_logic_vector(2 downto 0);
	prueba:		out std_logic_vector(1 downto 0);
	vf:			out std_logic;
	instr:		out std_logic_vector(1 downto 0);
	UPA:			out std_logic_vector(9 downto 0);
	DUPA:			out std_logic;
	OEUPA:		out std_logic;
	EA:			out std_logic_vector(1 downto 0);
	EB:			out std_logic_vector(1 downto 0);
	WA:			out std_logic;
	WB:			out std_logic
);
end memoria;

architecture Behavioral of memoria is
	signal tabla: std_logic_vector(26 downto 0);
begin
	process(entrada)
	begin
		case entrada is--            LIGAPRVIN  UPA9-0  DOEAWEBW
			when "0000"  => tabla <= "000000000000011000000110000";
			when "0001"  => tabla <= "000000000001100001000000000";
			when "0010"  => tabla <= "000000000000000101011011000";
			when "0011"  => tabla <= "010100101000000000010000000";
			when "0100"  => tabla <= "011010001001000000000110000";
			when "0101"  => tabla <= "000000000001000000100110110";
			when "0110"  => tabla <= "000000000101000000000000000";
			when "0111"  => tabla <= "000000000100000000000000000";
			when "1000"  => tabla <= "001101001000000101111011000";
			when "1001"  => tabla <= "000000000001011001000000000";
			when "1010"  => tabla <= "101010001000000000011000011";
			when others  => tabla <= "000010001000000000000000000";
		end case;
	end process;
	
	process(tabla)
	begin
		liga 		<= tabla(26 downto 23);
		prueba	<= tabla(22 downto 21);
		vf			<= tabla(20);
		instr		<= tabla(19 downto 18);
		UPA      <= tabla(17 downto 8);
		DUPA     <= tabla(7);
		OEUPA    <= tabla(6);
		EA			<= tabla(5 downto 4);
		WA			<= tabla(3);
		EB			<= tabla(2 downto 1);
		WB			<= tabla(0);
	end process;
end architecture;