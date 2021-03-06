library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity counter is
        port(Clk, Reset, Enable: in std_logic;
             Mode: in std_logic_vector(1 downto 0);
             Q: out std_logic_vector (5 downto 0));
end entity counter;

architecture behaviour of counter is
type mode_01_array is array (0 to 8) of integer;
signal mode_01_data : mode_01_array := (3, -2, 8, 15, -1, 7, -14, 10, 1);
begin
        process (Clk, Reset, Enable, Mode)
        variable v_Q: integer;
        variable count: integer;
                begin
                        if(Reset = '1')then
                                if (Mode = "00") then
                                        v_Q := 27;
                              elsif (Mode = "01") then
                                        v_Q := 3;
                                        count := 1;
                              elsif (Mode = "10") then
                                        v_Q := 0;
                              else
                                        v_Q := 63;
                              end if;
                        elsif(Mode'event) then
                              if (Mode = "00") then
                                        v_Q := 27;
                              elsif (Mode = "01") then
                                        v_Q := 3;
                                        count := 1;
                              elsif (Mode = "10") then
                                        v_Q := 0;
                              else
                                        v_Q := 63;
                              end if;
                        elsif (rising_edge(Clk)) then
                                if ((Enable = '1') and (Reset = '0')) then
                                       if(Mode = "00") then
                                            if (v_Q >= 13) then
                                                v_Q := v_Q - 2;
                                            else 
                                                v_Q := 27;
                                            end if;
                                          
                                       elsif(Mode = "01") then
                                           v_Q := mode_01_data(count);
                                           count := count + 1;
                                           if (count > 8) then
                                              count := 0;
                                           end if;
                                      
                                       elsif(Mode = "10") then   
                                           if (v_Q < 8) then
                                              v_Q := v_Q + 1;
                                           else 
                                              v_Q := 0;
                                           end if;     
                                       else         
                                           v_Q := 63;
                                       end if;
                               end if; 
                  end if;
Q <= std_logic_vector(to_signed(v_Q, Q'length));
end process;
end architecture behaviour;                                     