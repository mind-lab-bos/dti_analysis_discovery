# dti-analysis-discovery
Scripts used for DTI analysis on Discovery Cluster. Includes scripts for bedpostx, probtractx2, and extracting FA/other scalar values

# Initial steps:
  First, make sure you have account on Discovery Cluster. Go to https://northeastern.service-now.com/research?id=nurc_category and click on "Research Computing Access Request" to request an account, specifying Psyche Loui as the University Sponsor. This may take a few days/a week.
  https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/TBSS/UserGuide : This guide has all the information needed to preprocess and run other commands like bedpostx and probtractx. Read it in the meantime to familiarize yourself with all the commands, don't worry if it's overwhelming! The main thing to understand is knowing which commands to run in which order, and ensuring that your DTI data is in the specified format needed for each command.

# The basics:
https://rc-docs.northeastern.edu/en/latest/: This guide has a lot of helpful information on how to use the cluster.

Terminal: the main program you will use to connect to the cluster and run commands. Terminal uses Linux, so it is helpful to know some basic Linux commands (https://maker.pro/linux/tutorial/basic-linux-commands-for-beginners). Sorry, I know this is a lot of reading, but it will be helpful to read up before actually using what you learn! The most important commands I use are "cd", "ls", "vim" (edit scripts/files), "cat", and "chmod".

Filezilla (https://filezilla-project.org): a free tool you can use to easily transfer/view files in a GUI format instead of using the terminal for everything. To use it, login with your Host as username@discovery.neu.edu or username@xfer.discovery.neu.edu for file transfer. The username will be automatically filled. Type in your password and use port 22. Then click "Quickconnect" to connect!

FSL: this is the program you will be using to analyze DTI scans. FSLeyes (type "fsleyes" in terminal if you have FSL downloaded) is what you will be using, so I recommend downloading FSL on your local computer as well to run FSLeyes.
