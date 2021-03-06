--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : AccelADXL345.vhf
-- /___/   /\     Timestamp : 05/29/2020 22:53:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family xc9500xl -flat -suppress -vhdl C:/Users/Mikolaj/Desktop/xd/Projekt-UCISW2/AccelADXL345.vhf -w C:/Users/Mikolaj/Desktop/xd/Projekt-UCISW2/AccelADXL345.sch
--Design Name: AccelADXL345
--Device: xc9500xl
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AccelADXL345 is
   port ( BW_Tick : in    std_logic; 
          Clk     : in    std_logic; 
          Reset   : in    std_logic; 
          ID      : out   std_logic_vector (7 downto 0); 
          NACK    : out   std_logic; 
          X       : out   std_logic_vector (15 downto 0); 
          Y       : out   std_logic_vector (15 downto 0); 
          Z       : out   std_logic_vector (15 downto 0); 
          SCL     : inout std_logic; 
          SDA     : inout std_logic);
end AccelADXL345;

architecture BEHAVIORAL of AccelADXL345 is
   signal XLXN_1  : std_logic;
   signal XLXN_2  : std_logic;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic_vector (7 downto 0);
   signal XLXN_5  : std_logic_vector (7 downto 0);
   signal XLXN_6  : std_logic_vector (3 downto 0);
   signal XLXN_7  : std_logic;
   signal XLXN_8  : std_logic;
   signal XLXN_10 : std_logic_vector (7 downto 0);
   signal XLXN_49 : std_logic;
   component I2C_Master
      port ( Go         : in    std_logic; 
             Address    : in    std_logic_vector (7 downto 0); 
             ReadCnt    : in    std_logic_vector (3 downto 0); 
             SDA        : inout std_logic; 
             SCL        : inout std_logic; 
             FIFO_Pop   : in    std_logic; 
             FIFO_Push  : in    std_logic; 
             FIFO_DI    : in    std_logic_vector (7 downto 0); 
             FIFO_Empty : out   std_logic; 
             FIFO_Full  : out   std_logic; 
             FIFO_DO    : out   std_logic_vector (7 downto 0); 
             Reset      : in    std_logic; 
             Clk        : in    std_logic; 
             Busy       : out   std_logic; 
             NACK       : out   std_logic);
   end component;
   
   component AclMod
      port ( I2C_FIFO_Empty : in    std_logic; 
             I2C_FIFO_Full  : in    std_logic; 
             I2C_Busy       : in    std_logic; 
             Reset          : in    std_logic; 
             Clk            : in    std_logic; 
             BW_Tick        : in    std_logic; 
             I2C_FIFO_DO    : in    std_logic_vector (7 downto 0); 
             I2C_Go         : out   std_logic; 
             I2C_FIFO_Push  : out   std_logic; 
             I2C_FIFO_Pop   : out   std_logic; 
             I2C_FIFO_DI    : out   std_logic_vector (7 downto 0); 
             I2C_Addr       : out   std_logic_vector (7 downto 0); 
             I2C_ReadCnt    : out   std_logic_vector (3 downto 0); 
             ID             : out   std_logic_vector (7 downto 0); 
             X              : out   std_logic_vector (15 downto 0); 
             Y              : out   std_logic_vector (15 downto 0); 
             Z              : out   std_logic_vector (15 downto 0));
   end component;
   
begin
   XLXI_1 : I2C_Master
      port map (Address(7 downto 0)=>XLXN_5(7 downto 0),
                Clk=>Clk,
                FIFO_DI(7 downto 0)=>XLXN_4(7 downto 0),
                FIFO_Pop=>XLXN_3,
                FIFO_Push=>XLXN_2,
                Go=>XLXN_1,
                ReadCnt(3 downto 0)=>XLXN_6(3 downto 0),
                Reset=>Reset,
                Busy=>XLXN_49,
                FIFO_DO(7 downto 0)=>XLXN_10(7 downto 0),
                FIFO_Empty=>XLXN_7,
                FIFO_Full=>XLXN_8,
                NACK=>NACK,
                SCL=>SCL,
                SDA=>SDA);
   
   XLXI_2 : AclMod
      port map (BW_Tick=>BW_Tick,
                Clk=>Clk,
                I2C_Busy=>XLXN_49,
                I2C_FIFO_DO(7 downto 0)=>XLXN_10(7 downto 0),
                I2C_FIFO_Empty=>XLXN_7,
                I2C_FIFO_Full=>XLXN_8,
                Reset=>Reset,
                ID(7 downto 0)=>ID(7 downto 0),
                I2C_Addr(7 downto 0)=>XLXN_5(7 downto 0),
                I2C_FIFO_DI(7 downto 0)=>XLXN_4(7 downto 0),
                I2C_FIFO_Pop=>XLXN_3,
                I2C_FIFO_Push=>XLXN_2,
                I2C_Go=>XLXN_1,
                I2C_ReadCnt(3 downto 0)=>XLXN_6(3 downto 0),
                X(15 downto 0)=>X(15 downto 0),
                Y(15 downto 0)=>Y(15 downto 0),
                Z(15 downto 0)=>Z(15 downto 0));
   
end BEHAVIORAL;


