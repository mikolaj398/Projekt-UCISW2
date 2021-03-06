-- Vhdl test bench created from schematic C:\Users\Mikolaj\Desktop\xd\Projekt-UCISW2\AccelADXL345.sch - Fri May 29 22:34:53 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
use ieee.std_logic_textio.all;
LIBRARY std;
use std.textio.all;
ENTITY AccelADXL345_AccelADXL345_sch_tb IS
END AccelADXL345_AccelADXL345_sch_tb;
ARCHITECTURE behavioral OF AccelADXL345_AccelADXL345_sch_tb IS 

   COMPONENT AccelADXL345
   PORT( Clk	:	IN	STD_LOGIC; 
          X	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          ID	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          Y	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          Z	:	OUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          NACK	:	OUT	STD_LOGIC; 
          SCL	:	INOUT	STD_LOGIC; 
          SDA	:	INOUT	STD_LOGIC; 
          Reset	:	IN	STD_LOGIC; 
          BW_Tick	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL X	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL ID	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL Y	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL Z	:	STD_LOGIC_VECTOR (15 DOWNTO 0);
   SIGNAL NACK	:	STD_LOGIC;
   SIGNAL SCL	:	STD_LOGIC;
   SIGNAL SDA	:	STD_LOGIC;
   SIGNAL Reset	:	STD_LOGIC;
   SIGNAL BW_Tick	:	STD_LOGIC;

BEGIN

   UUT: AccelADXL345 PORT MAP(
		Clk => Clk, 
		X => X, 
		ID => ID, 
		Y => Y, 
		Z => Z, 
		NACK => NACK, 
		SCL => SCL, 
		SDA => SDA, 
		Reset => Reset, 
		BW_Tick => BW_Tick
   );

Clk <= not Clk after 10 ns;
	Reset <= '1', '0' after 500 ns;
   SDA <= 'H';
   SCL <= 'H';
	BW_Tick <= not BW_Tick after 80 ms;
   process
      variable bAddr  : std_logic_vector( 7 downto 0 );             -- I2C adress received as the first byte
      variable bWrite : std_logic_vector( 7 downto 0 );             -- byte received in write transfers
      variable bRead  : std_logic_vector( 7 downto 0 ) := X"E5";    -- byte transmitted in read transfers
      variable Ack : std_logic;
      variable L: line;	-- simulation messages (textio)
   begin
      SDA <= 'Z';
      loop
         -- wait for start condition
         wait until falling_edge( SDA ) and SCL /= '0';
         -- Report
         write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] START condition" );
         writeline( output, L );

         -- 8 bits of address
         for i in 0 to 8 loop
            wait until falling_edge( SCL );
            bAddr := bAddr( 6 downto 0 ) & SDA;
         end loop;
         -- Report
         write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] address byte: " ); hwrite( L, bAddr );
         writeline( output, L );
         
         -- pull down ACK for address byte
         wait for 2.5 us / 4;
         SDA <= '0';
         wait for 2.5 us;
         SDA <= 'Z';
         
         if bAddr( 0 ) = '0' then

            -- Master is writing
            loop
               -- Be prepared for Stop condition
               wait until rising_edge( SCL ); 
               wait until rising_edge( SDA ) or falling_edge( SCL );
               if rising_edge( SDA ) then
                  write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] STOP condition" );
                  writeline( output, L );
                  exit;
               end if;
               
               -- Another byte write, first bit (MSB)
               bWrite( 0 ) := SDA;
               
               -- another 7 bits of the write
               for i in 1 to 7 loop
                  wait until falling_edge( SCL );
                  bWrite := bWrite( 6 downto 0 ) & SDA;
               end loop;
               
               -- Report
               write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] byte received: " ); hwrite( L, bWrite );
               writeline( output, L );

               -- pull down for ACK the write
               wait for 2.5 us / 4;
               SDA <= '0';
               wait for 2.5 us;
               SDA <= 'Z';
             end loop;

         else

            -- Master is reading
            loop
               for i in 7 downto 0 loop
                  if bRead( i ) = '1' then
                     SDA <= 'Z';
                  else
                     SDA <= '0';
                  end if;
                  wait until falling_edge( SCL );
                  wait for 2.5 us / 4;
               end loop;
               SDA <= 'Z';
               
               -- Read ACK
               wait until rising_edge( SCL );
               wait for 2.5 us / 4;
               Ack := SDA;
               wait for 2.5 us / 2;
               
               -- Report
               write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] byte transmitted: " ); hwrite( L, bRead );
               if Ack = '0' then
                  write( L, " with positive ACK" );
               else
                  write( L, ", NACK in response" );
               end if;
               writeline( output, L );
					
					-- Increment byte to be transmitted in the next read slot
               bRead := std_logic_vector( unsigned( bRead ) + 1 );
					
               exit when Ack /= '0';
            end loop;

         end if;
         
      end loop;
   end process;
   --------------------------------------------------------------------

END;
