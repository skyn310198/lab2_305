library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity BCD_counter is
 port(Clk, Enable, Direction, Init: in std_logic;
      Q: out std_logic_vector(3 downto 0));
end entity BCD_counter;

architecture behaviour of BCD_counter is

begin
 process (Clk, Enable, Direction, Init)
  variable v_Q: integer;
 begin
  if(rising_edge(Clk)) then
   if(Init = '1') then
    if (Direction = '1') then
     v_Q := 9;
    else 
     v_Q := 0;
    end if;
   else  
   if (Enable = '1') then
    if (Direction = '1') then
     if (v_Q > 0) then
     v_Q := v_Q - 1;
     else 
     v_Q := 9;
     end if;
    else
     if (v_Q < 9) then
     v_Q := v_Q + 1;
     else 
     v_Q := 0;
     end if;
    end if;
   end if;
  end if;
 end if;
  Q <= std_logic_vector(to_signed(v_Q, Q'length));
 end process;
end architecture behaviour;
      