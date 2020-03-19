library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity BCD_counter is
 port(Clk, Enable, Direction: in std_logic;
      Init : in std_logic_vector(3 downto 0);
      Q: out std_logic_vector(3 downto 0));
end entity BCD_counter;

architecture behaviour of BCD_counter is

begin
 process (Clk, Enable, Direction)
  variable v_Q: std_logic_vector(3 downto 0);
  variable temp: boolean := false;
 begin
  if(rising_edge(Clk)) then
   if (temp = false) then
    if (Direction = '1') then
     v_Q := std_logic_vector(to_unsigned(9,v_Q'length));
     temp := true;
    else 
     v_Q := std_logic_vector(to_unsigned(0,v_Q'length));
     temp := true;
    end if;
   end if;  
   if (Enable = '1') then
    if (Direction = '1') then
     v_Q := v_Q - "0001";
    else
     v_Q := v_Q + "0001";
    end if;
   end if;
 end if;
  Q <= v_Q;
 end process;
end architecture behaviour;
      