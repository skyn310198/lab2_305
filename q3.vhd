library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity DownCounter is
  port (Clk, Enable, Reset: in std_logic;
        Q_1, Q_10: out std_logic_vector(3 downto 0));
end entity DownCounter;

architecture structural of DownCounter is
  signal t_Enable_10, t_Direction : std_logic;
  signal t_Q_1, t_Q_10 : std_logic_vector(3 downto 0);
  
component BCD_counter is
  port(
       Clk, Enable, Direction, Init : in std_logic;
       Q : out std_logic_vector(3 downto 0));
end component BCD_counter;
begin
 
 t_Direction <= '1'; 
 t_Enable_10 <= '1' when t_Q_1 = "1001" else '0';                               
 DUT_1: BCD_counter port map(Clk, Enable, t_Direction, Reset, t_Q_1);
 DUT_10: BCD_counter port map(Clk, t_Enable_10, t_Direction, Reset, t_Q_10);
 Q_1 <= t_Q_1 after 20 ns;
 Q_10 <= t_Q_10;

end architecture structural;