library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ms_carry_save_adder is
end ms_carry_save_adder;

architecture modul_sim of ms_carry_save_adder is

component carry_save_adder is
  Port (x,y,c : in STD_LOGIC_VECTOR(3 downto 0);
  Cout : out STD_LOGIC;
  S : out STD_LOGIC_VECTOR(4 downto 0));
end component;

signal a, b, c : STD_LOGIC_VECTOR(3 downto 0);
signal S : STD_LOGIC_VECTOR(4 downto 0);
signal cout : STD_LOGIC;

begin
    process
    begin
        a <= "0101";
        b <= "1000";
        c <= "0111";
        wait for 10 ns;
        a <= "1011"; 
        b <= "1101"; 
        c <= "1100";
        wait for 10 ns;
        a <= "0010"; 
        b <= "1001"; 
        c <= "0000";
        wait for 10 ns;
    end process;
    sim_carry_save_adder: carry_save_adder port map(x => a, y=>b, c=>c, Cout => cout, S => S);
end modul_sim;
