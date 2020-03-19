library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity test_counter is
end entity test_counter;

architecture test of test_counter is
  signal t_Clk, t_Enable, t_Reset : std_logic;
  signal t_Q : std_logic_vector(5 downto 0);
  signal t_Mode: std_logic_vector(1 downto 0);
  
component counter is
  port(Clk, Reset, Enable : in std_logic;
       Mode : in std_logic_vector(1 downto 0);
       Q : out std_logic_vector(5 downto 0));
end component counter;

begin
 DUT: counter
      port map(t_Clk,t_Reset,t_Enable,t_Mode,t_Q);
      
init: process
begin
 t_Reset <= '0','1' after 12 ns,'0' after 25 ns;
 t_Enable <= '1', '0' after 360 ns, '1' after 460 ns;
 t_Mode <= "00","01" after 30 ns, "10" after 45 ns,"11" after 80 ns;
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