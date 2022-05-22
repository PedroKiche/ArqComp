-- Pedro Augusto Tortola Pereira
-- Pedro Henrique Fracaro Kiche

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- operação  sel_op
--   A+B       00
--   A-B       01
--   A&B       10
--   A>B       11


entity ULA is
    port(
        ula_in_A: in unsigned(15 downto 0);
        ula_in_B: in unsigned(15 downto 0);
        
        ula_out: out unsigned(15 downto 0);
        ula_greater_flag: out STD_LOGIC;
        
        sel_op: in unsigned(1 downto 0)
    );
end entity ULA;
architecture a_ULA of ULA is
begin
    ula_out <=  ula_in_A + ula_in_B when sel_op = "00" else
                ula_in_A - ula_in_B when sel_op = "01" else
                ula_in_A and ula_in_B when sel_op = "10" else
                "0000000000000000";
    
    ula_greater_flag <= '1' when sel_op = "11" and ula_in_A > ula_in_B and ula_in_A(15) = '0' and ula_in_B(15) = '0' else
                '1' when sel_op = "11" and ula_in_A > ula_in_B and ula_in_A(15) = '1' and ula_in_B(15) = '1' else
                '1' when sel_op = "11" and ula_in_A(15) = '0' and ula_in_B(15) = '1' else
                '0';
    
end architecture a_ULA;