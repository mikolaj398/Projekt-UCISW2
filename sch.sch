<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4(7:0)" />
        <signal name="XLXN_5(7:0)" />
        <signal name="XLXN_6(3:0)" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_10(7:0)" />
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
        <port polarity="Output" name="BW_Tick" />
        <blockdef name="AclMod">
            <timestamp>2020-5-28T22:50:16</timestamp>
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
        <block symbolname="AclMod" name="XLXI_1">
            <blockpin signalname="XLXN_7" name="I2C_FIFO_Empty" />
            <blockpin signalname="XLXN_8" name="I2C_FIFO_Full" />
            <blockpin signalname="XLXN_49" name="I2C_Busy" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
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
            <blockpin signalname="BW_Tick" name="BW_Tick" />
        </block>
        <block symbolname="I2C_Master" name="XLXI_2">
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
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1696" y="1520" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1680" y1="1008" y2="1008" x1="1072" />
            <wire x2="1680" y1="1008" y2="1040" x1="1680" />
            <wire x2="1696" y1="1040" y2="1040" x1="1680" />
        </branch>
        <branch name="XLXN_4(7:0)">
            <wire x2="1344" y1="1200" y2="1200" x1="1072" />
            <wire x2="1344" y1="1200" y2="1392" x1="1344" />
            <wire x2="1680" y1="1392" y2="1392" x1="1344" />
            <wire x2="1696" y1="1392" y2="1392" x1="1680" />
        </branch>
        <branch name="XLXN_5(7:0)">
            <wire x2="1328" y1="1264" y2="1264" x1="1072" />
            <wire x2="1328" y1="1104" y2="1264" x1="1328" />
            <wire x2="1680" y1="1104" y2="1104" x1="1328" />
            <wire x2="1696" y1="1104" y2="1104" x1="1680" />
        </branch>
        <branch name="XLXN_6(3:0)">
            <wire x2="1312" y1="1328" y2="1328" x1="1072" />
            <wire x2="1312" y1="1168" y2="1328" x1="1312" />
            <wire x2="1680" y1="1168" y2="1168" x1="1312" />
            <wire x2="1696" y1="1168" y2="1168" x1="1680" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="544" y1="1088" y2="1088" x1="480" />
            <wire x2="480" y1="1088" y2="1872" x1="480" />
            <wire x2="2240" y1="1872" y2="1872" x1="480" />
            <wire x2="2176" y1="1328" y2="1328" x1="2160" />
            <wire x2="2240" y1="1328" y2="1328" x1="2176" />
            <wire x2="2240" y1="1328" y2="1872" x1="2240" />
        </branch>
        <branch name="XLXN_10(7:0)">
            <wire x2="544" y1="1488" y2="1488" x1="464" />
            <wire x2="464" y1="1488" y2="1632" x1="464" />
            <wire x2="2224" y1="1632" y2="1632" x1="464" />
            <wire x2="2176" y1="1392" y2="1392" x1="2160" />
            <wire x2="2176" y1="1392" y2="1424" x1="2176" />
            <wire x2="2224" y1="1424" y2="1424" x1="2176" />
            <wire x2="2224" y1="1424" y2="1632" x1="2224" />
        </branch>
        <instance x="544" y="1616" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_7">
            <wire x2="480" y1="896" y2="1008" x1="480" />
            <wire x2="544" y1="1008" y2="1008" x1="480" />
            <wire x2="2176" y1="896" y2="896" x1="480" />
            <wire x2="2176" y1="896" y2="1264" x1="2176" />
            <wire x2="2176" y1="1264" y2="1264" x1="2160" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1376" y1="1072" y2="1072" x1="1072" />
            <wire x2="1376" y1="1072" y2="1328" x1="1376" />
            <wire x2="1680" y1="1328" y2="1328" x1="1376" />
            <wire x2="1696" y1="1328" y2="1328" x1="1680" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1360" y1="1136" y2="1136" x1="1072" />
            <wire x2="1360" y1="1136" y2="1264" x1="1360" />
            <wire x2="1680" y1="1264" y2="1264" x1="1360" />
            <wire x2="1696" y1="1264" y2="1264" x1="1680" />
        </branch>
        <branch name="Clk">
            <wire x2="352" y1="1504" y2="1504" x1="288" />
            <wire x2="288" y1="1504" y2="1952" x1="288" />
            <wire x2="1280" y1="1952" y2="1952" x1="288" />
            <wire x2="352" y1="1408" y2="1408" x1="320" />
            <wire x2="352" y1="1408" y2="1504" x1="352" />
            <wire x2="544" y1="1408" y2="1408" x1="352" />
            <wire x2="1696" y1="1552" y2="1552" x1="1280" />
            <wire x2="1280" y1="1552" y2="1952" x1="1280" />
        </branch>
        <branch name="X(15:0)">
            <wire x2="1088" y1="1456" y2="1456" x1="1072" />
            <wire x2="1104" y1="1456" y2="1456" x1="1088" />
        </branch>
        <branch name="ID(7:0)">
            <wire x2="1088" y1="1392" y2="1392" x1="1072" />
            <wire x2="1104" y1="1392" y2="1392" x1="1088" />
        </branch>
        <branch name="Y(15:0)">
            <wire x2="1088" y1="1520" y2="1520" x1="1072" />
            <wire x2="1104" y1="1520" y2="1520" x1="1088" />
        </branch>
        <branch name="Z(15:0)">
            <wire x2="1088" y1="1584" y2="1584" x1="1072" />
            <wire x2="1104" y1="1584" y2="1584" x1="1088" />
        </branch>
        <branch name="NACK">
            <wire x2="2176" y1="1552" y2="1552" x1="2160" />
            <wire x2="2272" y1="1552" y2="1552" x1="2176" />
        </branch>
        <branch name="SCL">
            <wire x2="2192" y1="1104" y2="1104" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1104" name="SCL" orien="R0" />
        <branch name="SDA">
            <wire x2="2192" y1="1040" y2="1040" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2192" y="1040" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="368" y="1328" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="320" y="1408" name="Clk" orien="R180" />
        <iomarker fontsize="28" x="1104" y="1392" name="ID(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2272" y="1552" name="NACK" orien="R0" />
        <branch name="XLXN_49">
            <wire x2="496" y1="912" y2="1168" x1="496" />
            <wire x2="544" y1="1168" y2="1168" x1="496" />
            <wire x2="2352" y1="912" y2="912" x1="496" />
            <wire x2="2352" y1="912" y2="1488" x1="2352" />
            <wire x2="2176" y1="1488" y2="1488" x1="2160" />
            <wire x2="2352" y1="1488" y2="1488" x1="2176" />
        </branch>
        <branch name="Reset">
            <wire x2="432" y1="1328" y2="1328" x1="368" />
            <wire x2="544" y1="1328" y2="1328" x1="432" />
            <wire x2="432" y1="928" y2="1328" x1="432" />
            <wire x2="1296" y1="928" y2="928" x1="432" />
            <wire x2="1296" y1="928" y2="1488" x1="1296" />
            <wire x2="1696" y1="1488" y2="1488" x1="1296" />
        </branch>
        <branch name="BW_Tick">
            <wire x2="1104" y1="1712" y2="1712" x1="1072" />
        </branch>
        <iomarker fontsize="28" x="1104" y="1712" name="BW_Tick" orien="R0" />
        <iomarker fontsize="28" x="1104" y="1456" name="X(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1104" y="1520" name="Y(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1104" y="1584" name="Z(15:0)" orien="R0" />
    </sheet>
</drawing>