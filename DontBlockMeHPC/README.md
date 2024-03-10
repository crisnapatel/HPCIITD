# Don't Block Me HPC IIT Delhi
Prevents IITD user from being blocked by HPC due to purely unintentional CPU-intensive job submission on a login node

It's unfortunate that we, as humans, do make repeated mistakes. My HPC privileges were rescinded for the fourth time at a critical time when I needed to be quicker with my research work. It takes me by the suprise that HPC does not kill your CPU-intensive job on a login node in a min or in 30 sec with a warning on the active terminal. Rather, HPC lets the user run CPU-hungry jobs for many minutes and they just block you (they do send emails that you may not be checking while working), which puts you in unnecessary trouble. Writing apology emails and physically visiting them. While I know the reason for this particular policy, I do not think it is worth the trouble. 
I must mention that the HPC team at IIT Delhi is quite helpful. I cannot name anyone, but I have my favorite HPC Team member.

## Instructions:
1. Put ".DontBlockMeHPC.sh" and "Add_to_bashrc.sh" in your HOME dir.
2. add "source $HOME/Add_to_bashrc.sh" in your bashrc file
3. Source your bashrc file ("source ~/.bashrc") or simply close and reopen the terminal.

## You may want to keep in mind:
1. This is only an attempt to kill CPU-hungry jobs on the login[01-04] nodes.
2. It tries to kill all processes (not necessarily subprocesses spawned by programs like GNU parallel for instance).
3. .DontBlockMeHPC keeps running in the session with less than 0.00 CPU usage as long as the session is active.
4. The execution of the above-mentioned script stops when the active terminal is killed.
5. If a CPU-intensive job is fired on any of the login[01-04] nodes running for more than defined time (sec) with CPU usage exceeding as defined (in %), the process will be killed, and the user will be notified on the active terminal.
6. You can control the maximum allowed CPU usage (in %) and time (in sec) before a job should be killed. For that, adjust the 'duration' and 'threshold' vars in the .DontBlockMeHPC.sh file. It is advised to keep 'duration'<60 and 'threshold'<50%.
7. I have tried it with many cases that I could imagine and it works fine. If you find any problem, please report it. I must declare that the usage of this protocol should be at the users' discretion and risk.
