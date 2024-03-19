----------------------------------------------------------------
-- Author: Lorenzo Ruotolo
-- Name: CSD Processing Element
-- Description: Single PE unit used inside the encoder
----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.GLOBALS.all;

----------------------------------------------------------------
-- Entity
----------------------------------------------------------------

entity csd_pe is
    port (
        -- Inputs
        bypass_i   : in std_logic;
        prev_bit_i : in std_logic;
        curr_bit_i : in std_logic;
        next_bit_i : in std_logic;

        -- Outputs
        sign_o   : out std_logic;
        magn_o   : out std_logic;
        bypass_o : out std_logic
    );
end csd_pe;

----------------------------------------------------------------
-- Architecture
----------------------------------------------------------------

architecture rtl of csd_pe is

    signal bypass_gen_s : std_logic;

begin

    bypass_gen_s <= (prev_bit_i xnor curr_bit_i) nor bypass_i;

    sign_o   <= bypass_gen_s and next_bit_i;
    magn_o   <= bypass_gen_s;
    bypass_o <= bypass_gen_s;

end architecture rtl;
