library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity carry_save_adder is
  Port (x,y,c : in STD_LOGIC_VECTOR(3 downto 0);
  Cout : out STD_LOGIC;
  S : out STD_LOGIC_VECTOR(4 downto 0));
end carry_save_adder;

architecture Behavioral of carry_save_adder is

component full_adder is
    port (a,b,cin : in std_logic;
          sum : out std_logic;
          carry : out std_logic);
end component;

signal s1,T1,T2 : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin
    add10 : full_adder port map(a=>x(0),b=>y(0),cin=>c(0),sum=>s1(0),carry=>T1(0));
    add11 : full_adder port map(a=>x(1),b=>y(1),cin=>c(1),sum=>s1(1),carry=>T1(1));
    add12 : full_adder port map(a=>x(2),b=>y(2),cin=>c(2),sum=>s1(2),carry=>T1(2));
    add13 : full_adder port map(a=>x(3),b=>y(3),cin=>c(3),sum=>s1(3),carry=>T1(3));
    
    add20 : full_adder port map(a=>s1(1),b=>T1(0),cin=>T2(0),sum=>S(1),carry=>T2(1));
    add21 : full_adder port map(a=>s1(2),b=>T1(1),cin=>T2(1),sum=>S(2),carry=>T2(2));
    add22 : full_adder port map(a=>s1(3),b=>T1(2),cin=>T2(2),sum=>S(3),carry=>T2(3));
    add23 : full_adder port map(a=>'0',b=>T1(3),cin=>T2(3),sum=>S(4),carry=>Cout);
    
    S(0) <= s1(0);
    
end Behavioral;
