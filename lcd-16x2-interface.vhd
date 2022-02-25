--LCD consist of:
				--8- Data lines D0-D7, 
				--RS- Register Select line,
				--RW-Read Write line, 
				--En- Enable line.

--First we need to send commands to initialize the display, Curser Position, Clear Display, increment curser etc.

--After sending commands, Data can be transferred to Display in the LCD.

--Data can be transferred in 2 ways 8-bit mode and 4-bit mode. 
--Here we are interfacing in 8-bit mode with the entire Data pin D0-D7.

--ASCI Values for Commands used in the code
--38 = Function Set: 8-bit, 2 Line, 5×7 Dots

--0c = Display on Cursor off

--06 = Entry Mode

--01= Clear Display

--C0 = Place Curser to 2nd line

-- ASCI Values for Data’s used in the code :
--4d- M    45- E    44- D    41- A    5a- Z    49- I     5a- Z     4c- L    48- H     42- B  20- Space    53- S    4b- K    4f- O   52- R     50– P   54- T    45- E     43- C   48- H
--MEDAZIZLHB SKORPTECH
 

--VHDL Code consist for 2 counter i and j. 
--i counter used to divide the clock and j counter used to get the array elements.


library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity lcd is

port ( clk    : in std_logic;                          --clock i/p

lcd_rw : out std_logic;                         --read & write control

lcd_e : out std_logic;                         --enable control

lcd_rs : out std_logic;                         --data or command control

data  : out std_logic_vector(7 downto 0));     --data line

end lcd;



architecture Behavioral of lcd is

constant N: integer :=22;

type arr is array (1 to N) of std_logic_vector(7 downto 0);

constant datas : arr :=    (X"38",X"0c",X"06",X"01",X"C0",X"4d",x"45",x"44",x"41",x"5a",x"49",x"5a",x"4c",x"48",x"42",x"20",x"53",x"4b",x"4f",x"52",x"50",X"54",X"45",X"43",X"48");

--command and data to display

begin

lcd_rw <= '0';  --lcd write

process(clk)

variable i : integer := 0;

variable j : integer := 1;

begin



if clk'event and clk = '1' then

if i <= 1000000 then

i := i + 1;

lcd_e <= '1';

data 1000000 and i < 2000000 then

i := i + 1;

lcd_e <= '0';

elsif i = 2000000 then

j := j + 1;

i := 0;

end if;

if j <= 5  then

lcd_rs priceofcialis 5   then

lcd_rs <= '1';   --data signal

end if;

if j = 22 then  --repeated display of data

j := 5;

end if;

end if;



end process;

end Behavioral;