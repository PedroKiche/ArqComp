library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity UC is
    port(
        clk,rst: in STD_LOGIC;
        instruction: in unsigned(15 downto 0);
        jump_en: out STD_LOGIC;
        data_in_pc: out unsigned(7 downto 0);
        data_out_pc: in unsigned(7 downto 0);
        pc_att: out STD_LOGIC;
        rom_read: out STD_LOGIC;
        estado: in unsigned(1 downto 0);
        
        
        reg_wr: out STD_LOGIC;
        ULA_op: out unsigned(1 downto 0);
        ULAsrcB: out STD_LOGIC;
        sel_regA, sel_regB, sel_reg_wr: out unsigned(2 downto 0)
    );
end entity UC;


architecture a_UC of UC is
    signal opcode: unsigned(5 downto 0);
begin
    pc_att <= '1' when estado = "00" else '0';
    rom_read <= '1' when estado = "01" else '0';
    
    opcode <= instruction(15 downto 10);
    
    jump_en <= '1' when opcode="011111" else '0'; --jump
    
    data_in_pc <= instruction(7 downto 0) when jump_en = '1' else data_out_pc+1;
    
    ULA_op <= "00" when opcode(1 downto 0) ="00" else -- soma
              "01" when opcode(1 downto 0) ="01" else -- sub
              "10" when opcode(1 downto 0) ="10" else -- and
              "11"; -- maior que
    
    sel_regA <= instruction(9 downto 7);
    
    sel_regB <= instruction(6 downto 4);
    
    sel_reg_wr <= instruction(9 downto 7);
    
    ULAsrcB <= opcode(2);
    
    reg_wr <= opcode(5);    
    
end architecture a_UC;