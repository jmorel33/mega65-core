library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.debugtools.all;

entity lfsr16 is
  
  port (
    clock  : in  std_logic;
    reset  : in std_logic;
    seed   : in  unsigned(15 downto 0);
    step   : in std_logic;
    output    : out std_logic := '1'
);

end lfsr16;

architecture rtl of lfsr16 is
  signal state : unsigned(15 downto 0) := (others => '1');
begin  -- rtl
  
  process(clock)
  begin
    if rising_edge(clock) then
      if reset='1' then
        -- reset sequence to seed
        state <= seed;
        output <= '1';
      elsif step='1' then
        -- step
        state(9 downto 0) <= state(10 downto 1);
        state(10) <= state(11) xor state(0);
        state(11) <= state(12) xor state(0);
        state(12) <= state(13);
        state(13) <= state(14) xor state(0);
        state(14) <= state(15);
        state(15) <=       '0' xor state(0);
        output <= state(0);
      else
        -- do nothing
        state <= state;
      end if;
    end if;
  end process;

end rtl;
