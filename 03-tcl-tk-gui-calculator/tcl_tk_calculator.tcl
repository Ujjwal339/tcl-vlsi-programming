#!/usr/bin/env wish

package require Tk

wm title . "Tcl/Tk Calculator"
wm resizable . 0 0

set a ""
set b ""

proc add {} {
    global a b
    return [expr {$a + $b}]
}

proc sub {} {
    global a b
    return [expr {$a - $b}]
}

proc mul {} {
    global a b
    return [expr {$a * $b}]
}

proc div {} {
    global a b

    if {$b == 0} {
        return "Error: division by zero"
    }

    return [expr {double($a) / $b}]
}

proc calculate {op} {
    global a b

    if {![string is double -strict $a] || ![string is double -strict $b]} {
        .res configure -text "Result: Invalid input"
        return
    }

    switch -- $op {
        add {set result [add]}
        sub {set result [sub]}
        mul {set result [mul]}
        div {set result [div]}
        default {set result "Error: unknown operation"}
    }

    .res configure -text "Result: $result"
}

label .l1 -text "Number 1:"
entry .e1 -textvariable a -width 20
label .l2 -text "Number 2:"
entry .e2 -textvariable b -width 20

button .b1 -text "Add"      -width 10 -command {calculate add}
button .b2 -text "Subtract" -width 10 -command {calculate sub}
button .b3 -text "Multiply" -width 10 -command {calculate mul}
button .b4 -text "Divide"   -width 10 -command {calculate div}

label .res -text "Result:" -width 25 -anchor center

grid .l1 .e1 -padx 5 -pady 5
grid .l2 .e2 -padx 5 -pady 5
grid .res -columnspan 2 -padx 5 -pady 8
grid .b1 .b2 -padx 5 -pady 5
grid .b3 .b4 -padx 5 -pady 5
