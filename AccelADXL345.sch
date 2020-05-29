<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_4(7:0)" />
        <signal name="XLXN_5(7:0)" />
        <signal name="XLXN_6(3:0)" />
        <signal name="XLXN_8" />
        <signal name="XLXN_10(7:0)" />
        <signal name="XLXN_7" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="Clk" />
        <signal name="X(15:0)" />
        <signal name="ID(7:0)" />
        <signal name="Y(15:0)" />
        <signal name="Z(15:0)" />
        <signal name="NACK" />
        <signal name="SCL" />
        <signal name="SDA" />
        <signal name="XLXN_49" />
        <signal name="Reset" />
        <signal name="BW_Tick" />
        <port polarity="Input" name="Clk" />
        <port polarity="Output" name="X(15:0)" />
        <port polarity="Output" name="ID(7:0)" />
        <port polarity="Output" name="Y(15:0)" />
        <port polarity="Output" name="Z(15:0)" />
        <port polarity="Output" name="NACK" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="BW_Tick" />
        <blockdef name="I2C_Master">
            <timestamp>2015-11-24T14:12:50</timestamp>
            <rect width="336" x="64" y="-512" height="572" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="464" y1="-256" y2="-256" x1="400" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-140" height="24" />
            <line x2="464" y1="-128" y2="-128" x1="400" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <line x2="464" y1="32" y2="32" x1="400" />
        </blockdef>
        <blockdef name="AclMod">
            <timestamp>2020-5-29T20:43:38</timestamp>
            <line x2="528" y1="96" y2="96" x1="464" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="528" y1="-608" y2="-608" x1="464" />
            <line x2="528" y1="-544" y2="-544" x1="464" />
            <line x2="528" y1="-480" y2="-480" x1="464" />
            <rect width="64" x="464" y="-428" height="24" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <rect width="64" x="464" y="-364" height="24" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <rect width="64" x="464" y="-300" height="24" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-108" height="24" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
            <rect width="400" x="64" y="-640" height="768" />
        </blockdef>
        <block symbolname="I2C_Master" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="Go" />
            <blockpin signalname="XLXN_5(7:0)" name="Address(7:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="ReadCnt(3:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin signalname="XLXN_3" name="FIFO_Pop" />
            <blockpin signalname="XLXN_2" name="FIFO_Push" />
            <blockpin signalname="XLXN_4(7:0)" name="FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_7" name="FIFO_Empty" />
            <blockpin signalname="XLXN_8" name="FIFO_Full" />
            <blockpin signalname="XLXN_10(7:0)" name="FIFO_DO(7:0)" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_49" name="Busy" />
            <blockpin signalname="NACK" name="NACK" />
        </block>
        <block symbolname="AclMod" name="XLXI_2">
            <blockpin signalname="XLXN_7" name="I2C_FIFO_Empty" />
            <blockpin signalname="XLXN_8" name="I2C_FIFO_Full" />
            <blockpin signalname="XLXN_49" name="I2C_Busy" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="BW_Tick" name="BW_Tick" />
            <blockpin signalname="XLXN_10(7:0)" name="I2C_FIFO_DO(7:0)" />
            <blockpin signalname="XLXN_1" name="I2C_Go" />
            <blockpin signalname="XLXN_2" name="I2C_FIFO_Push" />
            <blockpin signalname="XLXN_3" name="I2C_FIFO_Pop" />
            <blockpin signalname="XLXN_4(7:0)" name="I2C_FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="I2C_Addr(7:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="I2C_ReadCnt(3:0)" />
            <blockpin signalname="ID(7:0)" name="ID(7:0)" />
            <blockpin signalname="X(15:0)" name="X(15:0)" />
            <blockpin signalname="Y(15:0)" name="Y(15:0)" />
            <blockpin signalname="Z(15:0)" name="Z(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2000" y="1440" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1984" y1="928" y2="928" x1="1376" />
            <wire x2="1984" y1="928" y2="960" x1="1984" />
            <wire x2="2000" y1="960" y2="960" x1="1984" />
        </branch>
        <branch name="XLXN_4(7:0)">
            <wire x2="1648" y1="1120" y2="1120" x1="1376" />
            <wire x2="1648" y1="1120" y2="1312" x1="1648" />
            <wire x2="2000" y1="1312" y2="1312" x1="1648" />
        </branch>
        <branch name="XLXN_5(7:0)">
            <wire x2="1632" y1="1184" y2="1184" x1="1376" />
            <wire x2="1632" y1="1024" y2="1184" x1="1632" />
            <wire x2="2000" y1="1024" y2="1024" x1="1632" />
        </branch>
        <branch name="XLXN_6(3:0)">
            <wire x2="1616" y1="1248" y2="1248" x1="1376" />
            <wire x2="1616" y1="1088" y2="1248" x1="1616" />
            <wire x2="2000" y1="1088" y2="1088" x1="1616" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="848" y1="1008" y2="1008" x1="784" />
            <wire x2="784" y1="1008" y2="1760" x1="784" />
            <wire x2="2544" y1="1760" y2="1760" x1="784" />
            <wire x2="2544" y1="1248" y2="1248" x1="2464" />
            <wire x2="2544" y1="1248" y2="1760" x1="2544" />
        </branch>
        <branch name="XLXN_10(7:0)">
            <wire x2="848" y1="1408" y2="1408" x1="768" />
            <wire x2="768" y1="1408" y2="1552" x1="768" />
            <wire x2="2528" y1="1552" y2="1552" x1="768" />
            <wire x2="2480" y1="1312" y2="1312" x1="2464" />
            <wire x2="2480" y1="1312" y2="1344" x1="2480" />
            <wire x2="2528" y1="1344" y2="1344" x1="2480" />
            <wire x2="2528" y1="1344" y2="1552" x1="2528" />
        </branch>
        <instance x="848" y="1536" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_7">
            <wire x2="784" y1="816" y2="928" x1="784" />
            <wire x2="848" y1="928" y2="928" x1="784" />
            <wire x2="2480" y1="816" y2="816" x1="784" />
            <wire x2="2480" y1="816" y2="1184" x1="2480" />
            <wire x2="2480" y1="1184" y2="1184" x1="2464" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1680" y1="992" y2="992" x1="1376" />
            <wire x2="1680" y1="992" y2="1248" x1="1680" />
            <wire x2="2000" y1="1248" y2="1248" x1="1680" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1664" y1="1056" y2="1056" x1="1376" />
            <wire x2="1664" y1="1056" y2="1184" x1="1664" />
            <wire x2="2000" y1="1184" y2="1184" x1="1664" />
        </branch>
        <branch name="Clk">
            <wire x2="656" y1="1424" y2="1424" x1="592" />
            <wire x2="592" y1="1424" y2="1888" x1="592" />
            <wire x2="1584" y1="1888" y2="1888" x1="592" />
            <wire x2="656" y1="1328" y2="1328" x1="624" />
            <wire x2="656" y1="1328" y2="1424" x1="656" />
            <wire x2="848" y1="1328" y2="1328" x1="656" />
            <wire x2="2000" y1="1472" y2="1472" x1="1584" />
            <wire x2="1584" y1="1472" y2="1888" x1="1584" />
        </branch>
        <branch name="X(15:0)">
            <wire x2="1392" y1="1376" y2="1376" x1="1376" />
            <wire x2="1408" y1="1376" y2="1376" x1="1392" />
        </branch>
        <branch name="ID(7:0)">
            <wire x2="1392" y1="1312" y2="1312" x1="1376" />
            <wire x2="1408" y1="1312" y2="1312" x1="1392" />
        </branch>
        <branch name="Y(15:0)">
            <wire x2="1392" y1="1440" y2="1440" x1="1376" />
            <wire x2="1408" y1="1440" y2="1440" x1="1392" />
        </branch>
        <branch name="Z(15:0)">
            <wire x2="1392" y1="1504" y2="1504" x1="1376" />
            <wire x2="1408" y1="1504" y2="1504" x1="1392" />
        </branch>
        <branch name="NACK">
            <wire x2="2480" y1="1472" y2="1472" x1="2464" />
            <wire x2="2576" y1="1472" y2="1472" x1="2480" />
        </branch>
        <branch name="SCL">
            <wire x2="2496" y1="1024" y2="1024" x1="2464" />
        </branch>
        <branch name="SDA">
            <wire x2="2496" y1="960" y2="960" x1="2464" />
        </branch>
        <branch name="XLXN_49">
            <wire x2="800" y1="832" y2="1088" x1="800" />
            <wire x2="848" y1="1088" y2="1088" x1="800" />
            <wire x2="2656" y1="832" y2="832" x1="800" />
            <wire x2="2656" y1="832" y2="1408" x1="2656" />
            <wire x2="2480" y1="1408" y2="1408" x1="2464" />
            <wire x2="2656" y1="1408" y2="1408" x1="2480" />
        </branch>
        <branch name="Reset">
            <wire x2="736" y1="1248" y2="1248" x1="672" />
            <wire x2="848" y1="1248" y2="1248" x1="736" />
            <wire x2="736" y1="848" y2="1248" x1="736" />
            <wire x2="1600" y1="848" y2="848" x1="736" />
            <wire x2="1600" y1="848" y2="1408" x1="1600" />
            <wire x2="2000" y1="1408" y2="1408" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="2496" y="1024" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="2496" y="960" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="672" y="1248" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="624" y="1328" name="Clk" orien="R180" />
        <iomarker fontsize="28" x="1408" y="1312" name="ID(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2576" y="1472" name="NACK" orien="R0" />
        <iomarker fontsize="28" x="1408" y="1376" name="X(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1408" y="1440" name="Y(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1408" y="1504" name="Z(15:0)" orien="R0" />
        <branch name="BW_Tick">
            <wire x2="1408" y1="1632" y2="1632" x1="1376" />
        </branch>
        <iomarker fontsize="28" x="1408" y="1632" name="BW_Tick" orien="R0" />
    </sheet>
</drawing>