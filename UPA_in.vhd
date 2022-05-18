library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity UPA_in is
port(
	UPA: in  std_logic_vector(3 downto 0);
	A:   in  std_logic_vector(7 downto 0);
	B:   in  std_logic_vector(7 downto 0);
	D:   in  std_logic_vector(7 downto 0);
	Q:   in  std_logic_vector(7 downto 0);
	R:	  out std_logic_vector(7 downto 0);
	S:	  out std_logic_vector(7 downto 0);
	CirCounter: out std_logic;
	IncCounter: out std_logic
);
end entity;

architecture Behavioral of UPA_in is
begin
	process(UPA)
	begin
		case UPA is
			when "0000" => 
				R <= A;
				S <= "0";
				CirCounter <= '0';
				IncCounter <= '0';
			when "0001" =>
				R <= A;
				S <= B;
				CirCounter <= '0';
				IncCounter <= '0';
			when "0010" =>
				R <= "0";
				S <= Q;
				CirCounter <= '0';
				IncCounter <= '0';
			when "0011" =>
				R <= "0";
				S <= B;
				CirCounter <= '0';
				IncCounter <= '0';
			when "0100" =>
				R <= "0";
				S <= A;
				CirCounter <= '0';
				IncCounter <= '0';
			when "0101" =>
				R <= D;
				S <= A;
				CirCounter <= '0';
				IncCounter <= '0';
			when "0110" =>
				R <= D;
				S <= Q;
				CirCounter <= '0';
				IncCounter <= '0';
			when "0111" =>
				R <= D;
				S <= "0";
				CirCounter <= '0';
				IncCounter <= '0';
			when "1000" =>
				R <= D;
				S <= B;
				CirCounter <= '0';
				IncCounter <= '0';
			when "1001" =>
				R <= Q;
				S <= B;
				CirCounter <= '0';
				IncCounter <= '0';
			when "1010" =>
				R <= B;
				S <= "0";
				CirCounter <= '1';
				IncCounter <= '0';
			when "1011" =>
				R <= B;
				S <= "0";
				CirCounter <= '0';
				IncCounter <= '1';
			when "1100" =>
				R <= Q;
				S <= A;
				CirCounter <= '0';
				IncCounter <= '0';
			when others =>
				R <= "0";
				S <= "0";
				CirCounter <= '0';
				IncCounter <= '0';
		end case;
	end process;
end architecture;