#!/bin/bash
# Extract R code blocks from 08-RMANOVA.qmd

awk '
/^```\{r/ {
    in_code=1
    print "=== LINE " NR " ==="
    next
}
/^```$/ && in_code {
    in_code=0
    print "=== END ==="
    print ""
    next
}
in_code {
    print
}
' 08-RMANOVA.qmd
