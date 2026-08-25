#!/usr/bin/tclsh

puts "----- Chip Utilization Calculator -----"

proc read_number {prompt} {
    puts -nonewline $prompt
    flush stdout
    gets stdin value

    if {![string is double -strict $value]} {
        error "Invalid numeric input: $value"
    }
    return $value
}

set width   [read_number "Enter core width: "]
set length  [read_number "Enter core length: "]

set lcells1 [read_number "Enter length of cell 1: "]
set wcells1 [read_number "Enter width of cell 1: "]
set lcells2 [read_number "Enter length of cell 2: "]
set wcells2 [read_number "Enter width of cell 2: "]
set lcells3 [read_number "Enter length of cell 3: "]
set wcells3 [read_number "Enter width of cell 3: "]

set core_area  [expr {$length * $width}]
set cell1_area [expr {$lcells1 * $wcells1}]
set cell2_area [expr {$lcells2 * $wcells2}]
set cell3_area [expr {$lcells3 * $wcells3}]
set total_cell  [expr {$cell1_area + $cell2_area + $cell3_area}]

if {$core_area <= 0} {
    error "Core area must be greater than zero."
}

set utilization [expr {100.0 * $total_cell / $core_area}]

puts "---------------------------------------"
puts [format "Total core area     = %.2f" $core_area]
puts [format "Total cell area     = %.2f" $total_cell]
puts [format "Utilization         = %.2f%%" $utilization]

if {$utilization >= 80.0} {
    puts "Status              = HIGH utilization"
} elseif {$utilization >= 60.0} {
    puts "Status              = MODERATE utilization"
} else {
    puts "Status              = SAFE utilization"
}
