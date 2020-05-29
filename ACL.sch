<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Clk" />
        <signal name="Reset" />
        <signal name="BW_Tick" />
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="NACK" />
        <signal name="Z(15:0)" />
        <signal name="Y(15:0)" />
        <signal name="ID(7:0)" />
        <signal name="X(15:0)" />
        <port polarity="Input" name="Clk" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="BW_Tick" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Output" name="NACK" />
        <port polarity="Output" name="Z(15:0)" />
        <port polarity="Output" name="Y(15:0)" />
        <port polarity="Output" name="ID(7:0)" />
        <port polarity="Output" name="X(15:0)" />
        <blockdef name="AccelADXL345">
            <timestamp>2020-5-29T20:48:50</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-428" height="24" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="AccelADXL345" name="XLXI_1">
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="BW_Tick" name="BW_Tick" />
            <blockpin signalname="X(15:0)" name="X(15:0)" />
            <blockpin signalname="ID(7:0)" name="ID(7:0)" />
            <blockpin signalname="Y(15:0)" name="Y(15:0)" />
            <blockpin signalname="Z(15:0)" name="Z(15:0)" />
            <blockpin signalname="NACK" name="NACK" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin signalname="SDA" name="SDA" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1584" y="1568" name="XLXI_1" orien="R0">
        </instance>
        <branch name="Clk">
            <wire x2="1584" y1="1152" y2="1152" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1552" y="1152" name="Clk" orien="R180" />
        <branch name="Reset">
            <wire x2="1584" y1="1344" y2="1344" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1552" y="1344" name="Reset" orien="R180" />
        <branch name="BW_Tick">
            <wire x2="1584" y1="1536" y2="1536" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1552" y="1536" name="BW_Tick" orien="R180" />
        <branch name="SDA">
            <wire x2="2000" y1="1536" y2="1536" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1536" name="SDA" orien="R0" />
        <branch name="SCL">
            <wire x2="2000" y1="1472" y2="1472" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1472" name="SCL" orien="R0" />
        <branch name="NACK">
            <wire x2="2000" y1="1408" y2="1408" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1408" name="NACK" orien="R0" />
        <branch name="Z(15:0)">
            <wire x2="2000" y1="1344" y2="1344" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1344" name="Z(15:0)" orien="R0" />
        <branch name="Y(15:0)">
            <wire x2="2000" y1="1280" y2="1280" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1280" name="Y(15:0)" orien="R0" />
        <branch name="ID(7:0)">
            <wire x2="2000" y1="1216" y2="1216" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1216" name="ID(7:0)" orien="R0" />
        <branch name="X(15:0)">
            <wire x2="2000" y1="1152" y2="1152" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1152" name="X(15:0)" orien="R0" />
    </sheet>
</drawing>