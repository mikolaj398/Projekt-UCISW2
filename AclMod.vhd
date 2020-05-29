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
			  BW_Tick : in  STD_LOGIC;
           I2C_Go : out  STD_LOGIC;
           I2C_FIFO_Push : out  STD_LOGIC;
           I2C_FIFO_Pop : out  STD_LOGIC;
           I2C_FIFO_DI : out  STD_LOGIC_VECTOR (7 downto 0);
           I2C_Addr : out  STD_LOGIC_VECTOR (7 downto 0);
           I2C_ReadCnt : out  STD_LOGIC_VECTOR (3 downto 0);
           ID : out  STD_LOGIC_VECTOR (7 downto 0);
           X : out  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0);
           Z : out  STD_LOGIC_VECTOR (15 downto 0));
end AclMod;

architecture Behavioral of AclMod is
   type state_type is ( Init, PushAddrID, SendAddrID, BusyAddrID, ReceiveID, BusyID, ReadID, PopID, CheckID, 
                        PushBwRateAddr, PushBwRate, SendBwRate, BusyBwRate, 
								PushModeAddr, PushMode, SendMode, BusyMode, 
								MeasureWait, MeasureReceive, MeasureBusy, MeasureRead, MeasurePop, 
                        MeasureCheck, MeasureLoad, MeasureOutput, MeasurePushAddr, MeasureSendAddr, MeasureBusyAddr );
	signal state, next_state : state_type;
   
   signal ID_reg : STD_LOGIC_VECTOR (7 downto 0);
   signal Input : STD_LOGIC_VECTOR (47 downto 0);
   
	signal bytes : integer range 0 to 5 := 0;
   
   signal X_reg : STD_LOGIC_VECTOR (15 downto 0);
   signal Y_reg : STD_LOGIC_VECTOR (15 downto 0);
   signal Z_reg : STD_LOGIC_VECTOR (15 downto 0);

begin
   process1 : process(Clk, BW_Tick)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				state <= Init;
			else
				state <= next_state;
			end if;
		end if;
	end process process1;
   
	process2 : process(state, I2C_FIFO_Empty, I2C_Busy, BW_Tick)
	begin
		next_state <= state;
	
		case state is
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
					next_state <= MeasureWait;
				end if;
        when MeasureWait =>
				if rising_edge(BW_Tick) then
					next_state <= MeasureReceive;
				end if;
         when MeasureReceive =>
				next_state <= MeasureBusy;
         when MeasureBusy =>
				if I2C_Busy = '0' then
					next_state <= MeasureRead;
				end if;
         when MeasureRead =>
				next_state <= MeasurePop;
			when MeasurePop =>
				next_state <= MeasureCheck; --
			when MeasureCheck =>
				if I2C_FIFO_Empty = '1' then
					next_state <= MeasureLoad;
            else
					next_state <= MeasureRead;
				end if;
         when MeasureLoad =>
            next_state <= MeasureOutput;
         when MeasureOutput =>
            next_state <= MeasurePushAddr;
         when MeasurePushAddr =>
            next_state <= MeasureSendAddr;
         when MeasureSendAddr =>
            next_state <= MeasureBusyAddr;
         when MeasureBusyAddr =>
            if I2C_Busy = '0' then
					next_state <= MeasureWait;
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
	
   input_register : process(Clk, state, next_state)
	begin
	   if rising_edge(Clk) then
			if state = MeasureRead then
            case bytes is
               when 0 =>
                  Input(47 downto 40) <= I2C_FIFO_DO;
               when 1 =>
                  Input(39 downto 32) <= I2C_FIFO_DO;
               when 2 =>
                  Input(31 downto 24) <= I2C_FIFO_DO;
               when 3 =>
                  Input(23 downto 16) <= I2C_FIFO_DO;
               when 4 =>
                  Input(15 downto 8) <= I2C_FIFO_DO;
               when 5 =>
                  Input(7 downto 0) <= I2C_FIFO_DO;
            end case;
			end if;
		end if;
	end process input_register;
   
   byte_counter : process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset = '1' then
				bytes <= 0;
			end if;
			if state = MeasurePop  then
				if bytes = 5 then
					bytes <= 0;
				else
					bytes <= bytes + 1;
				end if;
			end if;
		end if;
	end process byte_counter;
	
	output_sync : process(Clk, state, next_state)
	begin
	   if rising_edge(Clk) then
			if state = MeasureLoad  then
				X_reg <= Input(47 downto 32);
				Y_reg <= Input(31 downto 16);
				Z_reg <= Input(15 downto 0);
			end if;
		end if;
	end process output_sync;
	
   -- Output signals for FSM
	I2C_FIFO_DI <=	X"00" when next_state = PushAddrID or state = PushAddrID else --adres rejestru z ID urzadzenia
						X"2C" when next_state = PushBwRateAddr or state = PushBwRateAddr else --adres rejestru gdzie ustawia sie czestotliwosc pomiarow
						X"07" when next_state = PushBwRate or state = PushBwRate else --X"07" ustawia czestotliwosc na 12,5Hz
						X"2D" when next_state = PushModeAddr or state = PushModeAddr else --adres rejestru gdzie wlacza sie urzadzenie aby robilo pomiary
						X"08" when next_state = PushMode or state = PushMode else --X"08" ustawia na tryb pomiarow ciagly
						X"1E" when next_state = MeasurePushAddr or state = MeasurePushAddr else --adres rejestru z pomiarem X
						X"00";

	I2C_FIFO_Push <=	'1' when state = PushAddrID or state = PushBwRateAddr or state = PushBwRate
								 or state = PushModeAddr or state = PushMode or state = PushModeAddr 
								 or state = MeasurePushAddr else
							'0';
										
	I2C_Addr <=	X"3A" when next_state = SendAddrID or state = SendAddrID or next_state = SendBwRate
							or state = SendBwRate or next_state = SendMode or state = SendMode
							or next_state = MeasureSendAddr  or state = MeasureSendAddr  else
					X"3B" when next_state = ReceiveID or state = ReceiveID 
							or next_state = MeasureReceive or state = MeasureReceive else
					X"00";
									
	I2C_Go <=	'1' when state = SendAddrID or state = ReceiveID or state = SendBwRate or state = SendMode 
							or state = MeasureSendAddr	 or state = MeasureReceive else
					'0';
					
	I2C_ReadCnt <=	X"1" when next_state = ReceiveID or state = ReceiveID else
						X"6" when next_state = MeasureReceive or state = MeasureReceive else
						X"0";
						
	I2C_FIFO_Pop <=	'1' when state = PopID or state = MeasurePop else
							'0';
				  
   ID <= ID_reg;
   X <= X_reg;
   Y <= Y_reg;
   Z <= Z_reg;

end Behavioral;