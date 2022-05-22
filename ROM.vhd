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
        0=> B"0000000000000000",
        1=> B"111100_011_0000101",
        2=> B"111100_100_0001000",
        3=> B"100001_101_101_0000",
        4=> B"100000_011_100_0000",
        5=> B"1_01_0_00_101_011_0000",
        6=> B"100101_101_0000001",
        7=> B"011111_00_00010100",
        8=> B"100101_101_0000001",
        9=> B"100101_101_0000001",
        10=> B"100101_101_0000001",
        11=> B"100101_101_0000001",
        12=> B"100101_101_0000001",
        13=> B"100101_101_0000001",
        14=> B"100101_101_0000001",
        15=> B"100101_101_0000001",
        16=> B"100101_101_0000001",
        17=> B"100101_101_0000001",
        18=> B"100101_101_0000001",
        19=> B"100101_101_0000001",
        20=> B"100001_011_011_0000",
        21=> B"100000_011_101_0000",
        22=> B"011111_00_00000011",
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