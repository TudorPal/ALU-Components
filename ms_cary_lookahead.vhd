library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ms_carry_lookahead is
end ms_carry_lookahead;

architecture modul_sim of ms_carry_lookahead is

component carry_lookahead is
  Port (x,y : in STD_LOGIC_VECTOR(3 downto 0);
  T0 : in STD_LOGIC;
  T4 : out STD_LOGIC;
  S : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal a, b, c : STD_LOGIC_VECTOR(3 downto 0);
signal R0,R4 : STD_LOGIC;

begin
    process
    begin
        a <= "0101";
        b <= "1100";
        R0 <= '0';
        wait for 10 ns;
        a <= "0011"; 
        b <= "1001"; 
        R0 <= '1';   
        wait for 10 ns;
    end process;
    sim_carry_lookahead: carry_lookahead port map(x => a, y=>b, T0 => R0, T4 => R4, S => c);
end modul_sim;
