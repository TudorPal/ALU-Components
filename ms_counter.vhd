library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ms_counter is
end ms_counter;

architecture modul_sim of ms_counter is

component counter is
 Port (CLK : in STD_LOGIC;
 count : out integer range 0 to 7);
end component;

signal a : integer range 0 to 7;
constant c_CLK_PERIOD : time := 10 ns;
signal m_CLK: STD_LOGIC := '0';

begin
    m_CLK <= not m_CLK after c_CLK_PERIOD/2;
    sim_counter: counter port map(CLK => m_CLK, count => a);
end modul_sim;
