# Lee Lab Guide to Supercomputing
This is a guide to using the supercomputing cluster Greenplanet with Lumerical FDTD.
To begin, make an account by emailing Nathan Crawford, Director of Scientific Computing: nathan.crawford@uci.edu

Once you have your account, download Mobaxterm (https://mobaxterm.mobatek.net/download.html)
On the main terminal of Mobaxterm, type ssh -Y USERNAME@gplogin2.ps.uci.edu
And enter your password to login to the "login node"

To use and navigate the cluster, you must become familiar with UNIX commands.

USEFUL UNIX COMMANDS:
cd (Changes to a specific directory, EXAMPLE: cd EXAMPLE_FOLDER)
cd ~ (Moves back to the home directory
cd .. (Moves back one directory)
ls (Lists all current directories)
pwd (Prints the path to the current directory)
mkdir (Creates a directory/folder, EXAMPLE: mkdir Test_Results)

To view files, you would usually use vi (EXAMPLE: vi Notes.txt), but Mobaxterm allows you to use notepad to edit files, which is much easier to use than vim. I would recommend just using notepad to edit files.

