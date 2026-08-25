#!/usr/bin/tclsh

set input_file  "synthesis_report.txt"
set output_file "Design_summary.txt"

# Default values ensure the report remains well-formed if a metric is missing.
set name "UNKNOWN"
set area "N/A"
set power "N/A"
set wns "N/A"

if {[catch {open $input_file r} fh]} {
    puts stderr "Error: cannot open $input_file"
    exit 1
}

while {[gets $fh line] != -1} {
    if {[string match "*Dynamic*" $line]} {
        set fields [split $line]
        if {[llength $fields] > 3} {
            set power [lindex $fields 3]
        }
    }

    if {[string match "*Area*" $line]} {
        set fields [split $line]
        if {[llength $fields] > 3} {
            set area [lindex $fields 3]
        }
    }

    if {[string match "*Design*" $line]} {
        set fields [split $line]
        if {[llength $fields] > 3} {
            set name [lindex $fields 3]
        }
    }

    if {[string match "*WNS*" $line]} {
        set fields [split $line]
        if {[llength $fields] > 5} {
            set wns [lindex $fields 5]
        }
    }
}
close $fh

if {[catch {open $output_file w} fh]} {
    puts stderr "Error: cannot create $output_file"
    exit 1
}

puts $fh "========== Design Summary =========="
puts $fh "Design Name       : $name"
puts $fh "Total Area        : $area"
puts $fh "Dynamic Power     : $power mW"
puts $fh "Worst Slack (WNS) : $wns"
puts $fh "===================================="

if {[string is double -strict $wns]} {
    if {$wns < 0.0} {
        puts $fh "Status : TIMING VIOLATION DETECTED"
    } else {
        puts $fh "Status : NO TIMING VIOLATION"
    }
} else {
    puts $fh "Status : WNS VALUE NOT FOUND"
}

close $fh

puts "Report generated: $output_file"
