<project xmlns="com.autoesl.autopilot.project" name="canny" top="canny">
    <includePaths/>
    <libraryPaths/>
    <libraryFlag/>
    <Simulation argv="">
        <SimFlow askAgain="false" name="csim" ldflags="" mflags="" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../canny_test.cpp" sc="0" tb="1" cflags=" -I../.. -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../dst.txt" sc="0" tb="1" cflags=" -I../.. -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../src.txt" sc="0" tb="1" cflags=" -I../.. -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="canny.hpp" sc="0" tb="false" cflags="-I." csimflags="" blackbox="false"/>
        <file name="canny.cpp" sc="0" tb="false" cflags="-I." csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

