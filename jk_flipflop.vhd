library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
port(
j:in std_logic;
k:in std_logic;
clock:in std_logic;
enable:in std_logic;
q:out std_logic;
q_not:out std_logic
);
end jk_flipflop;

architecture behavior of jk_flipflop is
signal state:std_logic;
signal input: std_logic_vector(1 downto 0);
begin
input<=j & k;
process(clock, enable)
begin
if (enable='1') then
state<='0';
elsif(rising_edge(clock)) then
case (input) is
when "11"=>state<=not(state);
when "10"=>state<='1';
when "01"=>state<='0';
when others=>null;
end case;
end if;
end process;
end behavior;
