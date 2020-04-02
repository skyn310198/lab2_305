library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity test_counter_3 is
end entity test_counter_3;

architecture test of test_counter_3 is
  signal t_Clk, t_Enable, t_Reset : std_logic;
  signal t_Q_1, t_Q_10 : std_logic_vector(3 downto 0);
  
  
component DownCounter is
  port (Clk, Enable, Reset: in std_logic;
        Q_1, Q_10: out std_logic_vector(3 downto 0));
end component DownCounter;

begin
 DUT: DownCounter
      port map(t_Clk,t_Enable,t_Reset,t_Q_1,t_Q_10);
      
init: process
begin
 t_Enable <= '0', '1' after 100 ns, '0' after 500 ns, '1' after 600 ns;
 t_Reset <= '0', '1' after 600 ns, '0' after 650 ns;
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

