----------------------------------------------------------------
-- Author: Lorenzo Ruotolo
-- Name: CSD Encoder
-- Description: Top entity of the encoder
----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.GLOBALS.all;

----------------------------------------------------------------
-- Entity
----------------------------------------------------------------

entity csd_encoder is
    port (
        -- Inputs
        reset_i : in std_logic;
        latch_i : in std_logic;
        data_i  : in data_t;

        -- Outputs
        data_sign_o : out data_t;
        data_magn_o : out data_t
    );
end csd_encoder;

----------------------------------------------------------------
-- Architecture
----------------------------------------------------------------

architecture rtl of csd_encoder is

    component csd_pe is
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
    end component;

    signal bypass_s    : data_t;
    signal data_sign_s : data_t;
    signal data_magn_s : data_t;

begin

    generate_pe : for i in 0 to num_bits - 1 generate
        -- LSB Case
        g_lsb : if (i = 0) generate
            pe_lsb : csd_pe
            port map(
                bypass_i   => '0',
                prev_bit_i => data_i(i),
                curr_bit_i => data_i(i),
                next_bit_i => data_i(i + 1),
                sign_o     => data_sign_s(i),
                magn_o     => data_magn_s(i),
                bypass_o   => bypass_s(i)
            );
        end generate g_lsb;

        -- General Case
        g_all : if (i > 0 and i < num_bits - 1) generate
            pe_i : csd_pe
            port map(
                bypass_i   => bypass_s(i - 1),
                prev_bit_i => data_i(i - 1),
                curr_bit_i => data_i(i),
                next_bit_i => data_i(i + 1),
                sign_o     => data_sign_s(i),
                magn_o     => data_magn_s(i),
                bypass_o   => bypass_s(i)
            );
        end generate g_all;

        -- MSB Case
        g_msb : if (i = num_bits - 1) generate
            pe_msb : csd_pe
            port map(
                bypass_i   => bypass_s(i - 1),
                prev_bit_i => data_i(i - 1),
                curr_bit_i => data_i(i),
                next_bit_i => data_i(i),
                sign_o     => data_sign_s(i),
                magn_o     => data_magn_s(i),
                bypass_o   => open
            );
        end generate g_msb;
    end generate generate_pe;

    run : process (reset_i, latch_i, data_sign_s, data_magn_s)
    begin
        if (reset_i = '1') then
            bypass_s    <= (others => '0');
            data_sign_s <= (others => '0');
            data_magn_s <= (others => '0');
        elsif (latch_i = '1') then
            data_sign_o <= data_sign_s;
            data_magn_o <= data_magn_s;
        end if;
    end process run;

end architecture rtl;
