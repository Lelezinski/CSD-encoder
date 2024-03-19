----------------------------------------------------------------
-- Author: Lorenzo Ruotolo
-- Name: CSD TestBench
-- Description: Simple testbench for the encoder
----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.GLOBALS.all;

----------------------------------------------------------------
-- Entity
----------------------------------------------------------------

entity csd_pe_tb is
end csd_pe_tb;

----------------------------------------------------------------
-- Architecture
----------------------------------------------------------------

architecture tb_arch of csd_pe_tb is

    -- Constants
    constant CLK_PERIOD : time := 10 ns;

    -- Signals
    signal bypass_tb   : std_logic := '0';
    signal prev_bit_tb : std_logic := '0';
    signal curr_bit_tb : std_logic := '0';
    signal next_bit_tb : std_logic := '0';
    signal sign_tb     : std_logic;
    signal magn_tb     : std_logic;
    signal bypass_out_tb : std_logic;

    -- Component instantiation
    component csd_pe
        port (
            bypass_i   : in std_logic;
            prev_bit_i : in std_logic;
            curr_bit_i : in std_logic;
            next_bit_i : in std_logic;
            sign_o     : out std_logic;
            magn_o     : out std_logic;
            bypass_o   : out std_logic
        );
    end component;

begin

    -- DUT instantiation
    DUT : csd_pe
        port map (
            bypass_i   => bypass_tb,
            prev_bit_i => prev_bit_tb,
            curr_bit_i => curr_bit_tb,
            next_bit_i => next_bit_tb,
            sign_o     => sign_tb,
            magn_o     => magn_tb,
            bypass_o   => bypass_out_tb
        );

    -- Stimulus process
    stimulus_proc : process
    begin
        -- Initialize inputs
        bypass_tb   <= '0';
        prev_bit_tb <= '0';
        curr_bit_tb <= '0';
        next_bit_tb <= '0';

        -- Wait for a few clock cycles
        wait for CLK_PERIOD * 10;

        -- Provide test data
        prev_bit_tb <= '1';
        curr_bit_tb <= '0';
        next_bit_tb <= '1';

        -- Apply stimulus
        bypass_tb <= '1';

        -- Wait for a few clock cycles
        wait for CLK_PERIOD;
        prev_bit_tb <= '0';
        curr_bit_tb <= '0';
        next_bit_tb <= '0';
        bypass_tb <= '0';

        wait for CLK_PERIOD;
        prev_bit_tb <= '1';
        curr_bit_tb <= '0';
        next_bit_tb <= '0';
        bypass_tb <= '0';

        wait for CLK_PERIOD;
        prev_bit_tb <= '0';
        curr_bit_tb <= '1';
        next_bit_tb <= '0';
        bypass_tb <= '0';

        wait for CLK_PERIOD;
        prev_bit_tb <= '1';
        curr_bit_tb <= '1';
        next_bit_tb <= '0';
        bypass_tb <= '0';

        wait for CLK_PERIOD;
        prev_bit_tb <= '0';
        curr_bit_tb <= '0';
        next_bit_tb <= '1';
        bypass_tb <= '0';

        wait for CLK_PERIOD;
        prev_bit_tb <= '1';
        curr_bit_tb <= '0';
        next_bit_tb <= '1';
        bypass_tb <= '0';

        wait for CLK_PERIOD;
        prev_bit_tb <= '0';
        curr_bit_tb <= '1';
        next_bit_tb <= '1';
        bypass_tb <= '0';

        wait for CLK_PERIOD;
        prev_bit_tb <= '1';
        curr_bit_tb <= '1';
        next_bit_tb <= '1';
        bypass_tb <= '0';

        -- End simulation
        wait;
    end process stimulus_proc;

end tb_arch;