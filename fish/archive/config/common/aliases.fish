# Note: `> /dev/null` means "write to /dev/null instead of stdout", i.e. don't output to the terminal
#	`2>&1` means "write stderr to stdout", when combined with the above also sends stderr to /dev/null
#	combined this means "don't write out anything to the terminal", i.e. run in the background
#	the final & has the effect of running the command in the background
#	see https://linuxize.com/post/how-to-run-linux-commands-in-background/ for more info
alias dg='/home/alangardner/.local/share/DataGrip-2020.3/bin/datagrip.sh > /dev/null 2>&1 &'
