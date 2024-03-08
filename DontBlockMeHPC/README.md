# Dont Block Me HPC IIT Delhi
Prevents IITD user from being blocked by HPC due to purely unintentional CPU intensive job sumission on a login node

It's unfortunate that we, as humans, do make repeated mistakes. My HPC priviliges were rescinded for the fourth time at a critical time when I needed to be quicker with my research work. It takes me by the suprise that HPC does not kill your CPU intensive job, on a login node, in a min or in 30 sec with a warning on the active terminal. Rather HPC lets the user run CPU hungry jobs for many mins and they just block you (they do send emails which you may not be checking while working). Which puts you in an unnecesssary trouble. Writing apology emails and physically visiting them. while I know the reason of this particular policy, I do not think it is worth the trouble. 
I must mention that the HPC team at IIT Delhi is quite helpful. I cannot name anyone but I do have my fav HPC Team member.

Instructions:
1. Put ".DontBlockMeHPC.sh" in your HOME dir.
2. Copy the contents of Add_to_bashrc to your bashrc file
3. Source your bashrc file ("source ~/.bashrc")

You may want to keep in mind:
1. This is only an attempt to kill CPU hungry jobs on the login[01-04] nodes.
2. It tries to kill all subprocesses a process may have started (GNU parallele for instance).
3. .DontBlockMeHPC keeps running in the session with less than 0.00 cpu usages as long as the session is active.
4. Above-mentioned script execution stops when active terminal is killed.
5. If a CPU intensive job is fired on any of the login[01-04] nodes running for over 5 sec with cpu usages exceeding 10%, the job group will be killed and the user will be notified on the active terminal.
6. You can control the maximum allowed CPU usages (in %) and time (in sec) before a job a killed. For that, adjust 'duration' and 'threshold' vars in .DontBlockMeHPC.sh file. It is advised to keep 'duration'<60 and 'threshold'<50%.
7. The script doe