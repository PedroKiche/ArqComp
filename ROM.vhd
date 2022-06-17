library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ROM is
    port(
        clk : in STD_LOGIC;
        adress: in unsigned(7 downto 0);
        data_ROM: out unsigned(15 downto 0);
        rom_read: in STD_LOGIC
    );
end entity ROM;

architecture a_ROM of ROM is
    type mem is array (0 to 127) of unsigned(15 downto 0);
    constant rom_content : mem := (
        0=> B"0111000000000000",
        1=> B"1100_011_000000000",   -- MOVE 0, $R3
        2=> B"1100_100_000000000",   -- MOVE 0, $R3
        3=> B"0000_100_011_000_000", -- ADD $R4,$R3
        4=> B"1000_011_000000001",   -- ADDI $R3, 1
        5=> B"1011_000_000000000",   -- CMP $R0, 0  (RESETA A FLAG)
        6=> B"1011_011_000011110",   -- CMP $R3, 30
        7=> B"1101_0000_11111100",   -- BRANCH -4
        8=> B"0000_101_100_100_000", -- MOVE $R4, $R5
        9=> B"0111000000000000",
        10=> B"0111000000000000",
        11=> B"0111000000000000",
        12=> B"0111000000000000",
        13=> B"0111000000000000",
        14=> B"0111000000000000",
        15=> B"0111000000000000",
        16=> B"0111000000000000",
        17=> B"0111000000000000",
        18=> B"0111000000000000",
        19=> B"0111000000000000",
        20=> B"0111000000000000",
        21=> B"0111000000000000",
        others => (others => '0')
    );
begin
    process(clk)
    begin
        if(rom_read = '1') then
            if rising_edge(clk) then
                data_ROM <= rom_content(to_integer(adress));
            end if;
        end if;
    end process;

end architecture a_ROM;