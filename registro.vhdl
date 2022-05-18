library ieee;
use ieee.std_logic_1164.all;

entity registro is
port(
	clk:		in	 std_logic;
	reset:	in	 std_logic;
	entrada:	in  std_logic_vector(3 downto 0);
	salida:	out std_logic_vector(3 downto 0)
);
end registro;

architecture Behavioral of registro is
	signal tmp: std_logic_vector(3 downto 0) := B"0000";
begin
	process(clk,reset,entrada)
	begin
		if reset = '0' then
			tmp <= B"0000";
		elsif rising_edge(clk) then
			tmp <= entrada;
		end if;
	end process;
	
	process (tmp)
	begin
		salida <= tmp;
	end process;
end architecture;