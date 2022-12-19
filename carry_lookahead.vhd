library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity carry_lookahead is
  Port (x,y : in STD_LOGIC_VECTOR(3 downto 0);
  T0 : in STD_LOGIC;
  T4 : out STD_LOGIC;
  S : out STD_LOGIC_VECTOR(3 downto 0));
end carry_lookahead;

architecture Behavioral of carry_lookahead is

signal p,g : STD_LOGIC_VECTOR(3 downto 0);
signal T1,T2,T3 : STD_LOGIC;

begin
    p <= x xor y;
    g <= x and y;
    T1 <= g(0) or (p(0) and T0);
    T2 <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and T0);
    T3 <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and T0);
    T4 <= g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0)) or (p(3) and p(2) and p(1) and p(0) and T0);
    S(0) <= x(0) xor y(0) xor T0;
    S(1) <= x(1) xor y(1) xor T1;
    S(2) <= x(2) xor y(2) xor T2;
    S(3) <= x(3) xor y(3) xor T3;
    
end Behavioral;
