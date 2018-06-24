# Exercise Files
The exercise files are located in folders named to match the chapter and lesson they accompany.

Inside each folder is a file named Vagrantfile.  Each Vagrantfile contains a definition for a virtual machine running Ubuntu 18.04 LTS.

To boot the VM for a lesson, open a terminal (CMD or Powershell on Windows; Terminal on Mac) and navigate to the directory containing the Vagrantfile you want to use.

Then run the following command to boot up the VM:

        vagrant up

Run the following command to connect to the VM:

        vagrant ssh

You'll be logged into the VM and can then run commands directly on the VM.  

Exit the VM by typing exit or CTRL+D.

To stop the VM, run the following command from your terminal:

        vagrant halt

And to remove the VM, run:

        vagrant destroy

# Solutions
For each section, the "Solution" directory has a completed set up for that lesson.

To use the solution, first stop the VM running in the lesson directory with "vagrant halt".  Then cd into the Solution directory and run "vagrant up".  Investigate the solution by browsing to the demo site or logging in and taking a look at the configuration.
