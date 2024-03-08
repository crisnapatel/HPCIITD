# IITD HPC : Accessing the internet
This repository aims to share proxy.sh script that IIT Delhi HPC users may need to access the internet.
All of it boils down to the following steps:
1. Connect to HPC (ssh userid@hpc.iitd.ac.in)
2. Ask for a core on a compute node ("qsub -I select=1:ncpus=1 -P YOUR_PROJECT_ID")
3. In you HOME dir, place the 'proxy.sh' file
  1. Ensure that you have edited the proxy number, userid, and password in you 'proxy.sh'
4. define 'internet' and 'proxy' functions in your 'bashrc' file (nano ~/.bashrc)
5. source bashrc file (source ~/.bashrc)
6. Now, in one of the terminals (on the same compute node) run 'internet'
7. in the second terminal (on the same compute node; 'ssh compute_node_id') run 'proxy'
8. check if internet is active with 'wget google.com'

If you're a first time HPC user, you may watch a simple guide at: https://www.youtube.com/watch?v=kzejE0L5Ids
