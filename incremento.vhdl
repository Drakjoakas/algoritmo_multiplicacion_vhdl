library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity incremento is
port(
	entrada:  in  std_logic_vector(3 downto 0);
	salida:   out std_logic_vector(3 downto 0)
);
end incremento;

architecture Behavioral of incremento is
begin
	salida <= entrada + 1;
end architecture;