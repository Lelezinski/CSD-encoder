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

entity csd_tb is
end csd_tb;

----------------------------------------------------------------
-- Architecture
----------------------------------------------------------------

architecture tb_arch of csd_tb is

    -- Constants
    constant CLK_PERIOD : time := 10 ns;

    -- Signals
    signal reset_tb     : std_logic := '0';
    signal latch_tb     : std_logic := '0';
    signal data_tb      : data_t;
    signal data_sign_tb : data_t;
    signal data_magn_tb : data_t;

    -- Component instantiation
    component csd_encoder
        port (
            reset_i     : in std_logic;
            latch_i     : in std_logic;
            data_i      : in data_t;
            data_sign_o : out data_t;
            data_magn_o : out data_t
        );
    end component;

begin

    -- DUT instantiation
    DUT : csd_encoder
    port map(
        reset_i     => reset_tb,
        latch_i     => latch_tb,
        data_i      => data_tb,
        data_sign_o => data_sign_tb,
        data_magn_o => data_magn_tb
    );

    -- Stimulus process
    stimulus_proc : process
    begin
        -- Initialize inputs
        reset_tb <= '1';
        latch_tb <= '0';
        data_tb  <= (others => '0');

        -- Wait for a few clock cycles after reset
        wait for CLK_PERIOD * 10;
        reset_tb <= '0';
        latch_tb <= '1';

        -- Provide test data
        data_tb <= "00001011"; -- +11
        wait for CLK_PERIOD;
        data_tb <= "00001010"; -- +10
        wait for CLK_PERIOD;
        data_tb <= "11000001"; -- -63
        wait for CLK_PERIOD;

        -- End simulation
        wait;
    end process stimulus_proc;

end tb_arch;
