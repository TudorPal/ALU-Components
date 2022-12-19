library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ms_wallace_tree is
end ms_wallace_tree;

architecture modul_sim of ms_wallace_tree is

component wallace_tree is
  Port (x,y : in STD_LOGIC_VECTOR(3 downto 0);
  P : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal a, b : STD_LOGIC_VECTOR(3 downto 0);
signal P : STD_LOGIC_VECTOR(7 downto 0);

begin
    process
    begin
        a <= "0101";
        b <= "1000";
        wait for 10 ns;
        a <= "1001"; 
        b <= "1001"; 
        wait for 10 ns;
    end process;
    sim_wallace_tree: wallace_tree port map(x => a, y=>b,P=>P);
end modul_sim;
