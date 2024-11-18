# Lee Lab Guide to Supercomputing
This is a guide to using the supercomputing cluster Greenplanet with Lumerical FDTD.<br />
To begin, make an account by emailing Nathan Crawford, Director of Scientific Computing: nathan.crawford@uci.edu<br />

Once you have your account, download Mobaxterm (https://mobaxterm.mobatek.net/download.html)<br />
On the main terminal of Mobaxterm, type ssh -Y USERNAME@gplogin2.ps.uci.edu<br />
And enter your password to login to the "login node"<br />
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/45e04dc0-5c9f-4bcf-a8ad-4af6ffd713e7)
<br />
Other helpful resources: https://knowledge.ps.uci.edu/shelves/greenplanet

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
<br />
To view files, you would usually use vi (EXAMPLE: vi Notes.txt), but Mobaxterm allows you to use notepad to edit files, which is much easier to use than vim. I would recommend just using notepad to edit files- this is done by right clicking the file and selecting "Open with default text editor". 
<br />
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/6dda874d-4997-4ae6-a932-3fb767f8f358)
# Creating an Alias
Let's say you want to navigate to the lab's directory by cd'ing <br />
You would have to cd multiple times by doing (NOTE: that the forward slash / is important): <br />
cd /DFS-L <br />
cd /DATA <br />
cd /lee <br />
cd USERNAME <br />
<br />
This is quite cumbersome and it would be great if we could create some sort of short command that can do all of this in one line. This is what is known as an alias. An alias can be created by editing the .bash_profile or .bashrc. An example alias is shown here:
<br />
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/0cc81a76-0a0f-4b36-9898-31d91a5d5e38)
<br />
So here by typing in DATA at the commandline, it will automatically execute the displayed operations.
<br />

# Changing the Partition:<br />
Partitions are the different sets of CPUs/GPUs within greenplanet, with their own processor types and speeds. You cannot run a parrallel job across multiple partitions (technically you could but not recommended); however, you can select multiple partitions in the batch file (EXAMPLE: #SBATCH --partition=nes2.8,ilg2.3,brd2.4,has2.5) and the system will pick whichever partition is available. Each partitions is made up of nodes which are the individual computers that make up the cluster and each node will have several CPUs. Here are the list of available partitions that you can use:<br />
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/b94e3d9c-034a-44cd-aeaa-2e9835491756)<br />

# Running a Lumerical Script:<br />
To run a Lumerical FDTD file, you have to first load the file onto the cluster by dragging and dropping your .fsp file into the files on the leftside of the mobaxterm window.<br />
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/0ab554d9-ff81-411e-80ad-98d52ca5bb1e)<br />
The next step is to load a batch file that tells SLURM (the workload manager used in GP) to run your .fsp file or python file. A template batch file can be found in this github repository (titled "run_slurm.lumerical"). You will have to edit the batch file by changing the name of the .fsp to match yours.
<br />
<br />
You should now have an .fsp file and a batch file in your directory (you can check by typing ls).
To run the file, simply type sbatch run_slurm.lumerical. To access the results, simply download the .fsp to your computer and open it.
<br />
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/b035ee84-e5a6-4eea-b54e-8cf09e72c3e1)
![image](https://github.com/Howard-Lee-Nanophotonics-Lab/Lee-Lab-Guide-to-Supercomputing/assets/104177475/927e3e51-83ec-4fba-a8d8-4e3f32f62c67)
# Running Jupyter Notebook on Greenplanet:<br />
To use greenplanet via jupyter notebook, you need to do the following: <br />
1) Install miniconda on the DFS-L Directory:
<br />
cd wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh <br />
chmod u+x Miniconda3-latest-Linux-x86_64.sh <br />
mkdir /DFS-L/DATA/$(id -gn)/$USER/miniconda3 <br />
ln -s /DFS-L/DATA/$(id -gn)/$USER/miniconda3 miniconda3 <br />
./Miniconda3-latest-Linux-x86_64.sh -bu <br />
<br />
3) Activate miniconda in the terminal:<br />
ml miniconda/3/own<br />
<br />
4) Create your miniconda environment:<br />
conda create - n my_environment python<br />
<br />
5) Activate your miniconda environment:<br />
conda activate my_environment<br />
<br />
6) conda install jupyterlab<br />
<br />
7) Get an interative node:<br />
srun -c 2 -p nes2.8 --pty /bin/bash -i <br />
<br />
8) Run this command to start your jupyter notebook:<br />
jupyter lab --no-browser --ip $(hostname) --port=8989 <br />
<br />
9) On your local machine, use mobaxterm and ssh tunnel to this address: <br />
ssh -N -L 8989:NAMEOFNODE:8989 dangd5@gplogin2.ps.uci.edu <br />
Note that name of node corresponds to the name of the node shown when you run jupyter notebook (EXAMPLE: c-25-25). Also change the login username to your own obviously.<br />
<br />
10) To finally access the Jupyter Notebook, visit this site: http://127.0.0.1:8989/ (you might have to copy and paste after token=)<br />
<br />
11) To use Lumerical FDTD and its python API, use must cd to the following directory: /sopt/Lumerical/
<br />
# Installing MEEP on Greenplanet:<br />
1) conda activate my_environment <br />
2) conda install -c conda-forge pymeep pymeep-extras <br />
<br />
# Miscellaneous:<br />
To activate conda on the cluster type: <br />

To copy/install a conda environment from python, do the following:<br />
conda activate (your environment)<br />
conda env export > environment.yml<br />
conda list --explicit > environment.txt (Try this if above doesn't work)<br />
conda env create --name envname --file environment.yml <br />



