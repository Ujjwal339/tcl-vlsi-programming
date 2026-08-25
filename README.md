# Tcl VLSI Programming Experiments

A collection of **Tcl/Tk programming experiments** developed around VLSI physical design, EDA report automation, semiconductor design metrics, and digital logic.

The repository contains Experiments **5 through 9**, covering chip utilization, report parsing, Tcl/Tk GUI programming, regular expressions, and logic-gate simulation.

## Repository Structure

```text
tcl-vlsi-programming/
│
├── README.md
├── .gitignore
│
├── 05-chip-utilization-calculator/
│   └── chip_utilization.tcl
│
├── 06-vlsi-report-parser/
│   ├── vlsi_report_parser.tcl
│   └── synthesis_report.txt
│
├── 07-tcl-tk-gui-calculator/
│   └── tcl_tk_calculator.tcl
│
├── 08-regex-report-analysis/
│   ├── regex_report_analysis.tcl
│   └── lab8_input.txt
│
└── 09-logic-gate-simulator/
    └── logic_gate_simulator.tcl
```

## Experiments

### 5. Chip Utilization Calculator

The script calculates:

- Core area
- Individual cell areas
- Total cell area
- Utilization percentage

It then classifies utilization as:

| Utilization | Status |
|---|---|
| `< 60%` | Safe |
| `60% – <80%` | Moderate |
| `>= 80%` | High |

This is directly related to VLSI floorplanning, where utilization indicates how densely the available core area is occupied. The original experiment defines utilization as cell area divided by core area. fileciteturn1file6L20-L38

Run:

```bash
cd 05-chip-utilization-calculator
tclsh chip_utilization.tcl
```

---

### 6. VLSI Report Parser

This script reads a synthesis report and extracts:

- Design name
- Total area
- Dynamic power
- Worst Negative Slack (WNS)

It generates:

```text
Design_summary.txt
```

The script automatically reports a timing violation when WNS is negative. This follows the original experiment's timing-check objective. fileciteturn1file5L23-L30

Run:

```bash
cd 06-vlsi-report-parser
tclsh vlsi_report_parser.tcl
```

A sample `synthesis_report.txt` is included for testing.

---

### 7. Tcl/Tk GUI Calculator

A desktop calculator implemented using **Tcl/Tk**.

Operations:

- Addition
- Subtraction
- Multiplication
- Division

It demonstrates:

- Tk widgets
- `entry`
- `label`
- `button`
- `grid`
- Tcl procedures
- Event-driven programming
- Variable binding
- Error handling

The original experiment specifically uses four procedures and button commands to implement the calculator. fileciteturn1file4L60-L80

Run:

```bash
cd 07-tcl-tk-gui-calculator
wish tcl_tk_calculator.tcl
```

> `wish` must be available and Tcl/Tk must be installed.

The divide-by-zero handling has been corrected so that the procedure actually returns an error message instead of silently returning an empty result.

---

### 8. Regex-Based VLSI Report Analysis

This script demonstrates **regular expressions in Tcl** to extract VLSI metrics from a text report.

It extracts:

- Design name
- Total area
- Dynamic power
- WNS

It performs automated checks for:

- Dynamic power > 30 mW
- WNS < 0

The original experiment uses regex-based extraction and a 30 mW dynamic-power threshold. fileciteturn1file3L23-L43

Run:

```bash
cd 08-regex-report-analysis
tclsh regex_report_analysis.tcl
```

The output is generated as:

```text
Report_analysis.txt
```

A sample `lab8_input.txt` is included.

---

### 9. Tcl Logic Gate Simulator

This program simulates basic digital logic gates:

- AND
- OR
- XOR
- NAND
- NOR
- NOT

It demonstrates:

- Tcl procedures
- Lists
- Associative arrays
- `foreach`
- `lindex`
- `lrange`
- `switch`
- `expr`
- Boolean/bitwise operations

The original experiment explicitly targets these six logic gates and Tcl data structures such as strings, lists, arrays, and dictionaries. fileciteturn1file2L2-L12

Run:

```bash
cd 09-logic-gate-simulator
tclsh logic_gate_simulator.tcl
```

---

## Skills Demonstrated

### Tcl Programming

- Variables
- Expressions
- Input/output
- Conditions
- Loops
- Procedures
- Lists
- Associative arrays
- File handling
- Error handling
- String processing
- Regular expressions
- `switch`
- `foreach`

### Tcl/Tk

- GUI widgets
- Event-driven programming
- Button callbacks
- Entry fields
- Labels
- Grid geometry manager

### VLSI / EDA

- Floorplan utilization
- Core and cell area calculation
- PPA report parsing
- Dynamic power checking
- Timing/WNS checking
- Automated violation detection
- Logic verification
- EDA scripting concepts

## Improvements Made

The original lab programs were cleaned before being placed in this repository.

### Experiment 5

- Added reusable numeric-input procedure
- Added validation for core area
- Used safer `expr {...}` syntax
- Improved output formatting

### Experiment 6

- Added default values for missing metrics
- Added file-open error handling
- Added field-length checks
- Added explicit WNS validation
- Improved report formatting

### Experiment 7

- Fixed division-by-zero handling
- Added invalid-input validation
- Used safer Tcl expression syntax
- Improved GUI layout
- Changed the window title to a descriptive name

### Experiment 8

- Corrected floating-point regular expressions
- Added default values
- Added file error handling
- Improved report formatting
- Added explicit power and timing checks

### Experiment 9

- Added binary-input validation
- Added support for the single-input NOT gate
- Added unsupported-gate error handling
- Improved procedure naming and formatting

## Requirements

For command-line Tcl programs:

```bash
tclsh --version
```

For the GUI calculator:

```bash
wish --version
```

Required software:

- Tcl 8.6+ recommended
- Tk 8.6+ for Experiment 7

No third-party Tcl packages are required.

## Why This Repository Matters for VLSI

Tcl is widely used in EDA environments because it is well suited to automation, report processing, tool control, and repetitive design-flow tasks.

These experiments progress from basic Tcl programming to practical VLSI scripting:

```text
Basic Tcl
   ↓
Arithmetic & Conditions
   ↓
VLSI Floorplanning Metrics
   ↓
File & Report Parsing
   ↓
Regular Expressions
   ↓
Automated Violation Checks
   ↓
Logic Simulation
   ↓
Tcl/Tk GUI
```

## Author

**Ujjwal Kumar**

Roll No.: `230104028`

## License

This repository is intended primarily for academic and educational use.
