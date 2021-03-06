library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter is
port(
	clk:        in  std_logic;
	ClrCounter: in  std_logic;
	IncCounter: in  std_logic;
	FC:         out std_logic
);
end entity Counter;

architecture Behavioral of Counter is
	signal cnt : std_logic_vector(2 downto 0) := "000";
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if ClrCounter = '1' then
				cnt <= "000";
			elsif IncCounter = '1' then
				cnt <= cnt + '1';
			end if;
			
			if cnt = "111" then
				FC <= '1';
			else
				FC <= '0';
			end if;
		end if;
	end process;

end architecture;