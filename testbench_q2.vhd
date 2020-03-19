library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity test_counter is
end entity test_counter;

architecture test of test_counter is
  signal t_Clk, t_Enable, t_Direction : std_logic;
  signal t_Init: std_logic_vector(3 downto 0);
  signal t_Q : std_logic_vector(3 downto 0);
  
  
component BCD_counter is
  port(
       Clk, Enable, Direction : in std_logic;
       Init : in std_logic_vector(3 downto 0);
       Q : out std_logic_vector(3 downto 0));
end component BCD_counter;

begin
 DUT: BCD_counter
      port map(t_Clk,t_Enable,t_Direction,t_Init,t_Q);
      
init: process
begin
 t_Direction <= '0','1' after 12 ns,'0' after 25 ns;
 t_Enable <= '1', '0' after 360 ns, '1' after 460 ns;
 t_Init <= "0000","0001" after 30 ns, "1000" after 45 ns,"1001" after 80 ns;
 wait;
end process init;

clk_gen: process
begin
 wait for 5 ns;
 t_Clk <= '1';
 wait for 5 ns;
 t_Clk <= '0';
end process clk_gen;
end architecture test;
