library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity Processador is
    port(
        clk: in STD_LOGIC;
        rst: in STD_LOGIC;
        
        tl_estado: out unsigned(1 downto 0);
        tl_PC: out unsigned(7 downto 0);
        tl_instrucao: out unsigned(15 downto 0);
        tl_Reg1_out: out unsigned(15 downto 0);
        tl_Reg2_out: out unsigned(15 downto 0);
        tl_ULA_out:  out unsigned(15 downto 0)       
    );
end entity Processador;

architecture a_Processador of Processador is
    component MaquinaEstados is
        port
        (
            clk    : IN STD_LOGIC ;
            rst    : IN STD_LOGIC ;
            estado : OUT unsigned (1 downto 0)
        );
    end component;
    
    component PC is
        port
        (
            clk_pc      : IN std_logic ;
            wr_en       : IN std_logic ;
            rst         : IN std_logic ;
            data_in_pc  : IN unsigned (7 downto 0);
            data_out_pc : OUT unsigned (7 downto 0)
        );
    end component;
    
    component ROM is
        port
        (
            clk      : IN STD_LOGIC ;
            adress   : IN unsigned (6 downto 0);
            data_ROM : OUT unsigned (16 downto 0);
            rom_read : IN STD_LOGIC
        );
    end component;
    
    component BancoRegistradores is
        port
        (
            clk           : IN STD_LOGIC ;
            rst           : IN STD_LOGIC ;
            wr_en         : IN STD_LOGIC ;
            sel_reg_write : IN unsigned (2 downto 0);
            sel_regA_read : IN unsigned (2 downto 0);
            sel_regB_read : IN unsigned (2 downto 0);
            data_in_banco : IN unsigned (15 downto 0);
            data_out_regA : OUT unsigned (15 downto 0);
            data_out_regB : OUT unsigned (15 downto 0)
        );
    end component;
    
    component ULA is
        port
        (
            ula_in_A         : IN unsigned (15 downto 0);
            ula_in_B         : IN unsigned (15 downto 0);
            ula_out          : OUT unsigned (15 downto 0);
            ula_greater_flag : OUT STD_LOGIC ;
            sel_op           : IN unsigned (1 downto 0)
        );
    end component;
    
    component mux2x1 is
        port
        (
            sel     : IN STD_LOGIC ;
            data_I0 : IN signed (15 downto 0);
            data_I1 : IN signed (15 downto 0);
            data_O0 : OUT signed (15 downto 0)
        );
    end component;
    
    component UC is
        port
        (
            clk         : IN STD_LOGIC ;
            rst         : IN STD_LOGIC ;
            instruction : IN unsigned (15 downto 0);
            jump_en     : OUT STD_LOGIC ;
            data_in_pc  : OUT unsigned (7 downto 0);
            data_out_pc : IN unsigned (7 downto 0);
            pc_att      : OUT STD_LOGIC ;
            rom_read    : OUT STD_LOGIC ;
            estado      : IN unsigned (1 downto 0);
            reg_wr      : OUT STD_LOGIC ;
            ULA_op      : OUT unsigned (1 downto 0);
            ULAsrcB     : OUT STD_LOGIC ;
            sel_regA    : OUT unsigned (2 downto 0);
            sel_regB    : OUT unsigned (2 downto 0);
            sel_reg_wr  : OUT unsigned (2 downto 0)
        );
    end component;
    
    
    
begin

   

end architecture a_Processador;