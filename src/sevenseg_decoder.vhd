library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture Behavorial of sevenseg_decoder_tb is

    component sevenseg_decoder
        Port(
            i_Hex   : std_logic_vector(3 downto 0);
            o_seg_n : std_logic_vector(6 downto 0)
            );
    end component;
    signal i_hex : std_logic_vector  (3 downto 0) := (others=>'0');
    signal o_seg_n : std_logic_vector  (6 downto 0) := (others=>'1');


begin
    sevenseg_decoder_inst : sevenseg_decoder
    port map(
        i_hex => i_hex,
        o_seg_n=> o_seg_n
        );
        
        
    test_process : process 
    
    begin
    i_hex <= x"0"; wait for 10 ns;
    assert o_seg_n="1000000" report "Error on 0" severity failure;
    
    i_hex <= x"1"; wait for 10 ns;
    assert o_seg_n="1111001" report "Error on 1" severity failure;
    
    i_hex <= x"2"; wait for 10 ns;
    assert o_seg_n="0100100" report "Error on 2" severity failure;
    
    i_hex <= x"0"; wait for 10 ns;
    assert o_seg_n="1000000" report "Error on 0" severity failure;
    
    end process;
    
   end behavorial;




 

        