library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
 Port (CLK : in STD_LOGIC;
 count : out integer range 0 to 7);
end counter;

architecture Behavioral of counter is
signal tmp: integer range 0 to 7;
begin
cnt: process(CLK)
    begin
        if (CLK'event and CLK = '1') then
            tmp <= tmp + 1;
        end if;
    end process cnt;
count <= tmp;

end Behavioral;