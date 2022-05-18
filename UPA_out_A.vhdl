library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity UPA_out_A is
port(
	clk:   in  std_logic;
	Cin:   in  std_logic;
	Log:   in  std_logic;
	Rot:   in  std_logic;
	UPA:   in  std_logic_vector(9 downto 7);
	Hab:   in  std_logic;
	A:     in  std_logic_vector(7 downto 0);
	B:     in  std_logic_vector(7 downto 0);
	F:     in  std_logic_vector(7 downto 0);
	Qi:    out std_logic_vector(7 downto 0);
	Yi:    out std_logic_vector(7 downto 0)
);
end entity;

architecture Behavioral of UPA_out_A is
	signal Ct, Cm, Qm, Mul: std_logic;
	signal Qj, Yj: std_logic_vector(7 downto 0);
begin
	process(clk)
	begin
		if rising_edge(clK) then
			Ct <= Yj(0);
			Cm <= Yj(7);
			Qm <= Qj(7);
			Mul<= Yj(0);
			
			if Hab='1' then
				case UPA is
					when "000" => --Carga F en Yi y en Qi
						Ct <= '0';
						Yi <= F;
						Qi <= F;
						Yj <= F;
						Qj <= F;
					when "001" => --Carga F en Yi, Qi no se modifica
						Ct <= '0';
						Yi <= F;
						Yj <= F;
					when "010" => --Carga A en Yi, Qi no se modifica
						Ct <= '0';
						Yi <= A;
						Yj <= A;
					when "011" => --Carga B en Yi, Qi no se modifica
						Ct <= '0';
						Yi <= B;
						Yj <= B;
					when "100" => --Calcula F/2 y lo guarda en Yi, Qi no se modifica
						
						if Log='1' and not (Rot='1') then
							--Yi <= std_logic_vector(shift_right(unsigned(F),1));
							Yj <= std_logic_vector(shift_right(unsigned(F),1));
						elsif not (Log='1') and not (Rot='1') then
							--Yi <= std_logic_vector(shift_right(unsigned(F),1));
							--Yi(7) <= Cm;
							Yj <= std_logic_vector(shift_right(unsigned(F),1));
							Yj(7) <= Cm;
						elsif not (Log='1') and Rot='1' then
							--Yi <= std_logic_vector(shift_right(unsigned(F),1));
							---Yi(7) <= Cin;
							Yj <= std_logic_vector(shift_right(unsigned(F),1));
							Yj(7) <= Cin;
						end if;
					when "101" => --Calcula Qi/2 y lo guarda en Qi, Yi no se modifica
						
						if Log='1' and not (Rot='1') then
							Qj <= std_logic_vector(shift_right(unsigned(Qj),1));
						elsif not (Log='1') and not (Rot='1') then
							Qj <= std_logic_vector(shift_right(unsigned(Qj),1));
							Qj(7) <= Qm;
						elsif not (Log='1') and Rot='1' then
							Qj <= std_logic_vector(shift_right(unsigned(Qj),1));
							Qj(7) <= Cin;
						elsif Log='1' and Rot='1' then
							Qj <= std_logic_vector(shift_right(unsigned(Qj),1));
							Qi(7) <= Mul;
							Yj <= std_logic_vector(shift_right(unsigned(Yj),1));
							Yj(7) <= Cin;
						end if;
					when "110" => --Calcula 2F y lo guarda en Yi, Qi no se modifica
						if not (Rot='1') then
							Yj <= std_logic_vector(shift_left(unsigned(F),1));
						else
							Yj <= std_logic_vector(shift_left(unsigned(F),1));
							Yj(0) <= Cin;
						end if;
					when "111" => --Calcula 2Qi y lo guarda en Qi, Yi no se modifica
						if not (Rot='1') then
							Qj <= std_logic_vector(shift_left(unsigned(Qj),1));
						else
							Qj <= std_logic_vector(shift_left(unsigned(Qj),1));
							Qj(0) <= Cin;
						end if;
				end case;
			end if;
			Qi <= Qj;
			Yi <= Yj;
		end if;
	end process;
end architecture;