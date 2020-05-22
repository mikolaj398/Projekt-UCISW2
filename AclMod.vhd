----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:16:45 06/09/2019
-- Design Name: 
-- Module Name:    Magneto_Comp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AclMod is
    Port ( I2C_FIFO_Empty : in  STD_LOGIC;
           I2C_FIFO_Full : in  STD_LOGIC;
           I2C_FIFO_DO : in  STD_LOGIC_VECTOR (7 downto 0);
           I2C_Busy : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           I2C_Go : out  STD_LOGIC;
           I2C_FIFO_Push : out  STD_LOGIC;
           I2C_FIFO_Pop : out  STD_LOGIC;
           I2C_FIFO_DI : out  STD_LOGIC_VECTOR (7 downto 0);
           I2C_Addr : out  STD_LOGIC_VECTOR (7 downto 0);
           I2C_ReadCnt : out  STD_LOGIC_VECTOR (3 downto 0);
           ID : out  STD_LOGIC_VECTOR (7 downto 0);
           X : out  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0);
           Z : out  STD_LOGIC_VECTOR (7 downto 0));
end AclMod;

architecture Behavioral of AclMod is
	-- Main state machine
   type state_type is ( Init, PushAddrID, SendAddrID, BusyAddrID, ReceiveID, BusyID, ReadID, PopID, CheckID, 
                        PushBwRateAddr, PushBwRate, SendBwRate, BusyBwRate, 
								PushModeAddr, PushMode, SendMode, BusyMode, 
								MeasurePushXAddr,MeasureSendXAddr,MeasureBusyXAddr, ReadX, PopX,
								MeasurePushYAddr,MeasureSendYAddr,MeasureBusyYAddr, ReadY, PopY,
								MeasurePushZAddr,MeasureSendZAddr,MeasureBusyZAddr, ReadZ, PopZ);
	signal state, next_state : state_type;
   
	-- Input registers
   signal ID_reg : STD_LOGIC_VECTOR (7 downto 0);
   signal Input : STD_LOGIC_VECTOR (23 downto 0);
   
   -- Input byte counter
	signal bytes : integer range 0 to 2 := 0;
   
   -- Measure output registers
   signal X_reg : STD_LOGIC_VECTOR (7 downto 0);
   signal Y_reg : STD_LOGIC_VECTOR (7 downto 0);
   signal Z_reg : STD_LOGIC_VECTOR (7 downto 0);

begin
	-- Main HMC5883L FSM
	-- (continuos measurement)
   process1 : process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				state <= Init;
			else
				state <= next_state;
			end if;
		end if;
	end process process1;
   
	process2 : process(state, I2C_FIFO_Empty, I2C_Busy)
	begin
		next_state <= state; -- by default
		
		case state is
         -- Initialization
         -- Reading identification register
			when Init =>
					next_state <= PushAddrID;
			when PushAddrID =>
				next_state <= SendAddrID;
			when SendAddrID =>
				next_state <= BusyAddrID;
			when BusyAddrID =>
				if I2C_Busy = '0' then
					next_state <= ReceiveID;
				end if;
			when ReceiveID =>
				next_state <= BusyID;
			when BusyID =>
				if I2C_Busy = '0' then
					next_state <= ReadID;
				end if;
         when ReadID =>
            next_state <= PopID;
         when PopID =>
            next_state <= CheckID;
         when CheckID =>
            if I2C_FIFO_Empty = '1' then
					next_state <= PushBwRateAddr;
            else
					next_state <= ReadID;
				end if;
         -- Setting data rate and mode
         when PushBwRateAddr =>
				next_state <= PushBwRate;
         when PushBwRate =>   
            next_state <= SendBwRate;
			when SendBwRate =>
				next_state <= BusyBwRate;
			when BusyBwRate =>
				if I2C_Busy = '0' then
					next_state <= PushModeAddr;
				end if;
         when PushModeAddr =>
				next_state <= PushMode;
         when PushMode =>   
            next_state <= SendMode;
			when SendMode =>
				next_state <= BusyMode;
			when BusyMode =>
				if I2C_Busy = '0' then
					next_state <= MeasurePushXAddr;
				end if;
         when MeasurePushXAddr =>
            next_state <= MeasureSendXAddr;
         when MeasureSendXAddr =>
            next_state <= MeasureBusyXAddr;
         when MeasureBusyXAddr =>
				if I2C_Busy = '0' then
					next_state <= ReadX;
				end if;
			when ReadX =>
				next_state <= PopX;
			when PopX =>
				if I2C_Busy = '0' then
					next_state <= MeasurePushYAddr;
				end if;
			when MeasurePushYAddr =>
            next_state <= MeasureSendYAddr;
         when MeasureSendYAddr =>
            next_state <= MeasureBusyYAddr;
         when MeasureBusyYAddr =>
				if I2C_Busy = '0' then
					next_state <= ReadY;
				end if;
			when ReadY =>
				next_state <= PopY;
			when PopY =>
				if I2C_Busy = '0' then
					next_state <= MeasurePushZAddr;
				end if;
			when MeasurePushZAddr =>
            next_state <= MeasureSendZAddr;
         when MeasureSendZAddr =>
            next_state <= MeasureBusyZAddr;
         when MeasureBusyZAddr =>
				if I2C_Busy = '0' then
					next_state <= ReadZ;
				end if;
			when ReadZ =>
				next_state <= PopZ;
			when PopZ =>
				if I2C_Busy = '0' then
					next_state <= BusyMode;
				end if;
		end case;
	end process process2;
	
   id_register : process(Clk, state, next_state)
	begin
	   if rising_edge(Clk) then
			if state = ReadID then
				ID_reg(7 downto 0) <= I2C_FIFO_DO;
			end if;
		end if;
	end process id_register;
	
	read_value : process(Clk, state, next_state)
	begin
	   if rising_edge(Clk) then
			if state = ReadX then
				X_reg(7 downto 0) <= I2C_FIFO_DO;
			end if;
			if state = ReadY then
				Y_reg(7 downto 0) <= I2C_FIFO_DO;
			end if;
			if state = ReadZ then
				Z_reg(7 downto 0) <= I2C_FIFO_DO;
			end if;
		end if;
	end process read_value;
   
   -- Output signals for FSM
	I2C_FIFO_DI <=	X"00" when next_state = PushAddrID or state = PushAddrID else --adres rejestru z ID urzadzenia
						X"2C" when next_state = PushBwRateAddr or state = PushBwRateAddr else --adres rejestru gdzie ustawia sie czestotliwosc pomiarow
						X"07" when next_state = PushBwRate or state = PushBwRate else --X"07" ustawia czestotliwosc na 12,5Hz
						X"2D" when next_state = PushModeAddr or state = PushModeAddr else --adres rejestru gdzie wlacza sie urzadzenie aby robilo pomiary
						X"08" when next_state = PushMode or state = PushMode else --X"08" ustawia na tryb pomiarow ciagly
						X"1E" when next_state = MeasurePushXAddr or state = MeasurePushXAddr else --adres rejestru z pomiarem X
						X"1F" when next_state = MeasurePushYAddr or state = MeasurePushYAddr else --adres rejestru z pomiarem Y
						X"20" when next_state = MeasurePushZAddr or state = MeasurePushZAddr else --adres rejestru z pomiarem Z
						X"00";

	I2C_FIFO_Push <=	'1' when state = PushAddrID or state = PushBwRateAddr or state = PushBwRate
								 or state = PushModeAddr or state = PushMode or state = PushModeAddr 
								 or state = MeasurePushXAddr or state = MeasurePushYAddr or state = MeasurePushZAddr else
							'0';
										
	I2C_Addr <=	X"3A" when next_state = SendAddrID or state = SendAddrID or next_state = SendBwRate
							or state = SendBwRate or next_state = SendMode or state = SendMode
							or next_state = MeasureSendXAddr or state = MeasureSendXAddr 
							or next_state = MeasureSendYAddr or state = MeasureSendYAddr 
							or next_state = MeasureSendZAddr or state = MeasureSendZAddr else
					X"3B" when next_state = ReceiveID or state = ReceiveID 
							or next_state = ReadX or state = ReadX
							or next_state = ReadY or state = ReadY
							or next_state = ReadZ or state = ReadZ	else
					X"00";
									
	I2C_Go <=	'1' when state = SendAddrID or state = ReceiveID or state = SendBwRate or state = SendMode 
							or state = MeasureSendXAddr or state = ReadX
							or state = MeasureSendYAddr or state = ReadY
							or state = MeasureSendZAddr or state = ReadZ	else
					'0';
					
	I2C_ReadCnt <=	X"1" when next_state = ReceiveID or state = ReceiveID else
						X"1";
						
	I2C_FIFO_Pop <=	'1' when state = PopID or state = PopX or state = PopY or state = PopZ else
							'0';
   
	-- Output registers
   ID <= ID_reg;
   X <= X_reg;
   Y <= Y_reg;
   Z <= Z_reg;

end Behavioral;