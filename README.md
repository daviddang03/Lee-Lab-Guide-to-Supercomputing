# Lee Lab Guide to Supercomputing
This is a guide to using the supercomputing cluster Greenplanet with Lumerical FDTD.<br />
To begin, make an account by emailing Nathan Crawford, Director of Scientific Computing: nathan.crawford@uci.edu<br />

Once you have your account, download Mobaxterm (https://mobaxterm.mobatek.net/download.html)<br />
On the main terminal of Mobaxterm, type ssh -Y USERNAME@gplogin2.ps.uci.edu<br />
And enter your password to login to the "login node"<br />
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/45e04dc0-5c9f-4bcf-a8ad-4af6ffd713e7)


To use and navigate the cluster, you must become familiar with UNIX commands.<br />

# USEFUL UNIX COMMANDS:<br />
cd (Changes to a specific directory, EXAMPLE: cd EXAMPLE_FOLDER)<br />
cd ~ (Moves back to the home directory<br />
cd .. (Moves back one directory)<br />
ls (Lists all current directories)<br />
pwd (Prints the path to the current directory)<br />
mkdir (Creates a directory/folder, EXAMPLE: mkdir Test_Results)<br />
squeue --job JOBIDNUMBER (Views the progress of submitted jobs on the cluster, EXAMPLE: squeue --job 1234567)<br />
sbatch (Submits a job to SLURM, EXAMPLE sbatch run_slurm.lumerical)<br />
scancel JOBIDNUMBER (EXAMPLE: scancel 123456) 
<br />
To view files, you would usually use vi (EXAMPLE: vi Notes.txt), but Mobaxterm allows you to use notepad to edit files, which is much easier to use than vim. I would recommend just using notepad to edit files- this is done by right clicking the file and selecting "Open with default text editor". 
<br />

# Running a Lumerical Script:<br />
To run a Lumerical FDTD file, you have to first load the file onto the cluster by dragging and dropping your .fsp file into the files on the leftside of the mobaxterm window.<br />
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/0ab554d9-ff81-411e-80ad-98d52ca5bb1e)<br />
The next step is to load a batch file that tells SLURM (the workload manager used in GP) to run your .fsp file or python file. A template batch file can be found in this github repository (titled "run_slurm.lumerical"). You will have to edit the batch file by changing the name of the .fsp to match yours.
<br />
You should now have an .fsp file and a batch file in your directory (you can check by typing ls).
To run the file, simply type sbatch run_slurm.lumerical. To access the results, simply download the .fsp to your computer and open it.


