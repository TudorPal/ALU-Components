library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port (a,b,cin : in std_logic;
          sum : out std_logic;
          carry : out std_logic);
end full_adder;

architecture Behavioral of full_adder is

begin

    sum <= a xor b xor cin;
    carry <= (a and b) or (cin and (a xor b));

end;