library ieee;
use ieee.std_logic_1164.all;

entity logica is
port(
	instr:	in	std_logic_vector(1 downto 0);
	cc:		in  std_logic;
	ma:		out std_logic;
	vect:		out std_logic;
	pl:		out std_logic;
	sel:		out std_logic
);
end logica;

architecture Behavioral of logica is
begin
	process(cc,instr)
	begin
		--Paso continuo
		if instr = B"00" then 
			sel  <= '0';
			ma   <= '1';
			pl   <= '1';
			vect <= '1';
		end if;
		--Salto Condicional
		if instr = B"01" then
			if CC = '0' then
				sel  <= '1';
				ma   <= '1';
				pl   <= '0';
				vect <= '1';
			else
				sel  <= '0';
				ma   <= '1';
				pl   <= '1';
				vect <= '1';
			end if;
		end if;
		--Salto de Transformación
		if instr = B"10" then
			sel  <= '1';
			ma   <= '0';
			pl   <= '1';
			vect <= '1';
		end if;
		--Salto de Interrupción
		if instr = B"11" then
			if cc = '0' then
				sel  <= '1';
				ma   <= '1';
				pl   <= '1';
				vect <= '0';
			else
				sel  <= '0';
				ma   <= '1';
				pl   <= '1';
				vect <= '1';
			end if;
		end if;
	end process;
end architecture;
