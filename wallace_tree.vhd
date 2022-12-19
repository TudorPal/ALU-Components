library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity wallace_tree is
  Port (x,y : in STD_LOGIC_VECTOR(3 downto 0);
  P : out STD_LOGIC_VECTOR(7 downto 0));
end wallace_tree;

architecture Behavioral of wallace_tree is

component full_adder is
    port (a,b,cin : in std_logic;
          sum : out std_logic;
          carry : out std_logic);
end component;

component half_adder is
    port (a,b : in std_logic;
          sum : out std_logic;
          carry : out std_logic);
end component;

signal s1 : STD_LOGIC_VECTOR(9 downto 0);
signal s2 : STD_LOGIC_VECTOR(10 downto 0);
signal s3 : STD_LOGIC_VECTOR(7 downto 0);

begin
    P(0) <= x(0) and y(0);
    s1(0) <= x(0) and y(1);
    s1(1) <= x(1) and y(0);
    s1(2) <= x(0) and y(2);
    s1(3) <= x(1) and y(1);
    s1(4) <= x(2) and y(0);
    s1(5) <= x(1) and y(2);
    s1(6) <= x(2) and y(1);
    s1(7) <= x(3) and y(0);
    s1(8) <= x(2) and y(2);
    s1(9) <= x(3) and y(1);
    
    ha1 : half_adder port map(a=>s1(0),b=>s1(1),sum=>P(1),carry=>s2(0));
    fa1 : full_adder port map(a=>s1(2),b=>s1(3),cin=>s1(4),sum=>s2(1),carry=>s2(2));
    fa2 : full_adder port map(a=>s1(5),b=>s1(6),cin=>s1(7),sum=>s2(3),carry=>s2(5));
    ha2 : half_adder port map(a=>s1(8),b=>s1(9),sum=>s2(6),carry=>s2(8));
    
    s2(4) <= x(0) and y(3);
    s2(7) <= x(1) and y(3);
    s2(9) <= x(2) and y(3);
    s2(10) <= x(3) and y(2);
    
    ha3 : half_adder port map(a=>s2(0),b=>s2(1),sum=>P(2),carry=>s3(0));
    fa3 : full_adder port map(a=>s2(2),b=>s2(3),cin=>s2(4),sum=>s3(1),carry=>s3(2));
    fa4 : full_adder port map(a=>s2(5),b=>s2(6),cin=>s2(7),sum=>s3(3),carry=>s3(4));
    fa5 : full_adder port map(a=>s2(8),b=>s2(9),cin=>s2(10),sum=>s3(5),carry=>s3(6));
    
    s3(7) <= x(3) and y(3);
    
    P(3) <= s3(0) or s3(1);
    P(4) <= s3(2) or s3(3);
    P(5) <= s3(4) or s3(5);
    P(6) <= s3(6) xor s3(7);
    P(7) <= s3(6) and s3(7);

end Behavioral;
