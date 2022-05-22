library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity ROM is
    port(
        clk : in STD_LOGIC;
        adress: in unsigned(6 downto 0);
        data_ROM: out unsigned(16 downto 0);
        rom_read: in STD_LOGIC
    );
end entity ROM;

architecture a_ROM of ROM is
    type mem is array (0 to 127) of unsigned(15 downto 0);
    constant rom_content : mem := ( 
         0=> "0000000000000000",
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