<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xc9500xl" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="X(15:0)" />
        <signal name="ID(7:0)" />
        <signal name="Y(15:0)" />
        <signal name="Z(15:0)" />
        <signal name="NACK" />
        <signal name="SCL" />
        <signal name="SDA" />
        <signal name="Reset" />
        <signal name="Clk" />
        <port polarity="Output" name="X(15:0)" />
        <port polarity="Output" name="ID(7:0)" />
        <port polarity="Output" name="Y(15:0)" />
        <port polarity="Output" name="Z(15:0)" />
        <port polarity="Output" name="NACK" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="Clk" />
        <blockdef name="AccelADXL345">
            <timestamp>2020-5-29T20:25:2</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-492" height="24" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <rect width="64" x="320" y="-428" height="24" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <rect width="64" x="320" y="-364" height="24" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="AccelADXL345" name="XLXI_1">
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="X(15:0)" name="X(15:0)" />
            <blockpin signalname="ID(7:0)" name="ID(7:0)" />
            <blockpin signalname="Y(15:0)" name="Y(15:0)" />
            <blockpin signalname="Z(15:0)" name="Z(15:0)" />
            <blockpin signalname="NACK" name="NACK" />
            <blockpin name="BW_Tick" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin signalname="SDA" name="SDA" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <iomarker fontsize="28" x="1712" y="976" name="X(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1040" name="ID(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1104" name="Y(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1168" name="Z(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1232" name="NACK" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1360" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="1712" y="1424" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="1264" y="1424" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="1264" y="976" name="Clk" orien="R180" />
        <branch name="X(15:0)">
            <wire x2="1712" y1="976" y2="976" x1="1680" />
        </branch>
        <branch name="ID(7:0)">
            <wire x2="1712" y1="1040" y2="1040" x1="1680" />
        </branch>
        <branch name="Y(15:0)">
            <wire x2="1712" y1="1104" y2="1104" x1="1680" />
        </branch>
        <branch name="Z(15:0)">
            <wire x2="1712" y1="1168" y2="1168" x1="1680" />
        </branch>
        <branch name="NACK">
            <wire x2="1712" y1="1232" y2="1232" x1="1680" />
        </branch>
        <branch name="SCL">
            <wire x2="1712" y1="1360" y2="1360" x1="1680" />
        </branch>
        <branch name="SDA">
            <wire x2="1712" y1="1424" y2="1424" x1="1680" />
        </branch>
        <branch name="Reset">
            <wire x2="1296" y1="1424" y2="1424" x1="1264" />
        </branch>
        <branch name="Clk">
            <wire x2="1296" y1="976" y2="976" x1="1264" />
        </branch>
        <instance x="1296" y="1456" name="XLXI_1" orien="R0">
        </instance>
    </sheet>
</drawing>