library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;

package GLOBALS is

    constant num_bits : integer := 8;
    subtype data_t is std_logic_vector(num_bits - 1 downto 0);

end GLOBALS;