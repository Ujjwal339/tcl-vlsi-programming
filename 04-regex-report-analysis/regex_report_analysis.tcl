#!/usr/bin/tclsh

set input_file  "lab8_input.txt"
set output_file "Report_analysis.txt"

set design "UNKNOWN"
set area 0.0
set power 0.0
set wns 0.0

if {[catch {open $input_file r} fh]} {
    puts stderr "Error: cannot open $input_file"
    exit 1
}

while {[gets $fh line] != -1} {
    if {[regexp {Design\s*Name\s*:\s*(\w+)} $line -> value]} {
        set design $value
    } elseif {[regexp {Total\s*Area\s*:\s*(-?\d+(?:\.\d+)?)} $line -> value]} {
        set area $value
    } elseif {[regexp {Dynamic\s*Power\s*:\s*(-?\d+(?:\.\d+)?)} $line -> value]} {
        set power $value
    } elseif {[regexp {Worst\s*Slack\s*\(WNS\)\s*:\s*(-?\d+(?:\.\d+)?)} $line -> value]} {
        set wns $value
    }
}

close $fh

if {[catch {open $output_file w} fh]} {
    puts stderr "Error: cannot create $output_file"
    exit 1
}

puts $fh "========== Report Analysis =========="
puts $fh "Design Analyzed          : $design"
puts $fh [format "Estimated Total Area   : %.2f um^2" $area]
puts $fh [format "Dynamic Power           : %.2f mW" $power]
puts $fh [format "Worst Slack (WNS)       : %.3f" $wns]
puts $fh "======================================"

if {$power > 30.0} {
    puts $fh "Power Check              : VIOLATION (> 30.0 mW)"
} else {
    puts $fh "Power Check              : NO VIOLATION"
}

if {$wns < 0.0} {
    puts $fh "Timing Check             : VIOLATION (WNS < 0)"
} else {
    puts $fh "Timing Check             : NO VIOLATION"
}

close $fh

puts "Analysis report generated: $output_file"
