library ieee;
use ieee.std_logic_1164.all;

entity acumulador is
port(
	clk: in  std_logic;
	W:	  in  std_logic;
	E:   in  std_logic_vector(1 downto 0);
	A:	  in  std_logic_vector(7 downto 0);
	B:	  in  std_logic_vector(7 downto 0);
	C:	  in  std_logic_vector(7 downto 0);
	Ao:  out std_logic_vector(7 downto 0);
	Bo:  out std_logic_vector(7 downto 0);
	Co:  out std_logic_vector(7 downto 0)
);
end entity;

architecture Behavioral of  acumulador is
	signal memoria: std_logic_vector(7 downto 0);
begin
	process(clk,W)
	begin
		if rising_edge(clk) then
			if w = '0' then
				case E is
					when "01" => memoria <= A;
					when "10" => memoria <= B;
					when "11" => memoria <= C;
					when others => memoria <= memoria;
				end case;
			else 
				case E is
					when "01" => Ao <= memoria;
					when "10" => Bo <= memoria;
					when "11" => Co <= memoria;
					when others => memoria <= memoria;
				end case;
			end if;
		end if;
	end process;
end architecture;