library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lpm;
use lpm.lpm_components.all;


entity ALU_8bit is
port(
	Cin:  in  std_logic;
	UPA:  in  std_logic_vector(6 downto 4);
	R:	   in  std_logic_vector(7 downto 0);
	S:    in  std_logic_vector(7 downto 0);
	clk:  in  std_logic;
	Inc:  in  std_logic;
	Dec:  in  std_logic;
	Neg:  in  std_logic;
	Haba: in  std_logic;
	--H:		out std_logic;
	--N:    out std_logic;
	--Z:    out std_logic;
	--V:    out std_logic;
	--C:    out std_logic;
	F:    out std_logic_vector(7 downto 0)
);
end entity ALU_8bit;

architecture Behavioral of ALU_8bit is
	
	signal add_sub: std_logic;
	signal Fa,R1,S1: std_logic_vector(7 downto 0);
	--signal addsub1: lpm_add_sum(result <= Fa, cin <= Cin, dataa <= R1, datab <= S1, add_sub <= add_sub);
begin
	process(R,S)
	begin
		case UPA is
			when "000" =>	--Suma R + S + Cin
				
				add_sub <= '1';
				F <= R+S+cin;
				--Ht <= R(3) and S(3) or S(3) and (not F(3)) or (not F(3)) and R(3);
				--Ct <= R(7) and S(7) or S(7) and (not F(7)) or (not F(7)) and R(7);
				--if Inc='1' then --Banderas Incremento
					--Vt <= (not R(7)) and (andR(6 downto 0));
				--else 
					--VT <= R(7) and S(7) and (not F(7)) or (not R(7)) and (not S(7)) and F(7);
				--end if;
			when "001" => --Resta S-R-(~Cin)
				
				add_sub <= '0';
				F <= S - R - (not Cin);
				--Ht <= '0';
				--if Dec = Neg then --Banderas para una resta
					--Vt <= S(7) and (not R(7)) and (not F(7)) or (not S(7)) and R(7) and F(7);
					--Ct <= (not S(7)) and R(7) or R(7) and F(7) or F(7) and (not S(7));
				--elsif Dec and not  Neg then --Banderas para un decremento
					--Vt <= not F(7) and (and F(6 downto 0));
					--Ct <= '0';
				--elsif not Dec and Neg then --Banderas para una negación
					--Vt <= F(7) and (not F(6)) and (not F(5)) and (not F(4)) and (not F(3)) and (not F(2)) and (not F(1)) and (not F(0));
					--Ct <= (or F);
				--end if;
			when "010" => --Resta R-S-(~Cin)
				
				add_sub <= '0';
				F <= R - S - (not Cin);
				--Ht <= '0';
				--if Dec = Neg then --Banderas para una resta
					--Vt <= R(7) and (not S(7)) and (not F(7)) or (not R(7)) and S(7) and F(7);
					--Ct <= (not R(7)) and S(7) or S(7) and F(7) or F(7) and (not R(7));
				--elsif Dec and not Neg then --Banderas para un decremento
					--Vt <= (not F(7)) and (and F(6 downto 0));
					--Ct <= '0';
				--elsif not Dec and Neg then --Banderas para una negación
					--Vt <= F(7) and (not F(6)) and (not F(5)) and (not F(4)) and (not F(3)) and (not F(2)) and (not F(1)) and (not F(0));
					--Ct <= (or F);
				--end if;
			when "011" => --Ejecuta R or S
				F <= R or S;
				--Ht <= '0';
				--Ct <= '0';
				--Vt <= '0';
			when "100" => --Ejecuta R and S
				F <= R and S;
				--Ht <= '0';
				--Ct <= '0';
				--Vt <= '0';
			when "101" => --Ejecuta ~R and S
				F <= not R and S;
				--H1 <= '0';
				--Ct <= '0';
				--Vt <= '0';
			when "110" => --Ejecuta R ^ S
				F <= R xor S;
				--H1 <= '0';
				--Ct <= '0';
				--Vt <= '0';
			when "111" => --Ejecuta R xnor S
				F <= R xnor S;
				--H1 <= '0';
				--Ct <= '0';
				--Vt <= '0';
		end case;
	end process;
	
	--process(clk)
	--begin
		--if rising_edge(clK) then
			--if Haba = '1' then
				--C <= Ct;
				--N <= F(7);
				--Z <= not (or F);
				--V <= Vt;
				--H <= Ht;
			--end if;
		--end if;
	--end process;
end architecture;