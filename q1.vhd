library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity Seq_Counter is
        port(Clk, Reset, Enable: in std_logic;
             Mode: in std_logic_vector(1 downto 0);
             Q: out std_logic_vector (5 downto 0));
end entity Seq_Counter;

architecture behaviour of Seq_Counter is
type mode_01_array is array (8 downto 0) of integer;
signal mode_01_data : mode_01_array := (3, -2, 8, 15, -1, 7, -14, 10, 1)
begin
        process (Clk, Reset, Enable)
        variable v_Q: integer;
        variable count: integer;
                begin
                        if(Reset = '1')then
                                if (Mode = "00") then
                                        v_Q := 27;
                              elsif (Mode = "01") then
                                        v_Q := 3;
                                        count := 0;
                              elsif (Mode = "10") then
                                        v_Q := 0;
                              else (Mode = "11") then
                                        v_Q := 1;
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
                                           v_Q := 1;
                                       end if;
                               end if;
                               Q <= v_Q;
                  end if;
        end process;
end architecture behaviour;                                     