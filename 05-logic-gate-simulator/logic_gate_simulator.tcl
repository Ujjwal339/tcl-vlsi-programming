#!/usr/bin/tclsh

# Associative array used to store the final result for each gate.
array set output {}

proc evaluate_gate {gate inputs} {
    set a [lindex $inputs 0]
    set b [expr {[llength $inputs] > 1 ? [lindex $inputs 1] : 0}]

    # Validate binary inputs.
    if {![string is integer -strict $a] || ($a != 0 && $a != 1)} {
        error "Invalid first input for $gate: $a"
    }

    if {$gate ne "NOT" &&
        (![string is integer -strict $b] || ($b != 0 && $b != 1))} {
        error "Invalid second input for $gate: $b"
    }

    switch -- $gate {
        AND  { return [expr {$a & $b}] }
        OR   { return [expr {$a | $b}] }
        XOR  { return [expr {$a ^ $b}] }
        NAND { return [expr {!($a & $b)}] }
        NOR  { return [expr {!($a | $b)}] }
        NOT  { return [expr {!$a}] }
        default {
            error "Unsupported gate: $gate"
        }
    }
}

set testcases {
    {AND 1 0}
    {OR 1 0}
    {XOR 1 1}
    {NAND 1 1}
    {NOR 0 0}
    {NOT 1}
}

puts "----- Tcl Logic Gate Simulator -----"

foreach test $testcases {
    set gate [lindex $test 0]
    set inputs [lrange $test 1 end]

    set result [evaluate_gate $gate $inputs]
    set output($gate) $result

    puts [format "Gate: %-4s  Inputs: %-5s  Output: %s" \
        $gate $inputs $output($gate)]
}
