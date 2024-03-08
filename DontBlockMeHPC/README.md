# Dont Block Me HPC IIT Delhi
Prevents IITD user from being blocked by HPC due to purely unintentional CPU intensive job sumission on a login node

It's unfortunate that we, as humans, do make repeated mistakes. My HPC priviliges were rescinded for the fourth time at a critical time when I needed to be quicker with my research work. It takes me by the suprise that HPC does not kill your CPU intensive job, on a login node, in a min or in 30 sec with a warning on the active terminal. Rather HPC lets the user run CPU hungry jobs for many mins and they just block you (they do send emails which you may not be checking while working). Which puts you in an unnecesssary trouble. Writing apology emails and physically visiting them. while I know the reason of this particular policy, I do not think it is worth the trouble. 
I must mention that the HPC team at IIT Delhi is quite helpful. I cannot name anyone but I do have my fav HPC Team member.

Instructions:
1. Put ".DontBlockMeHPC.sh" in your HOME dir.
2. Copy the contents of Add_to_bashrc to your bashrc file
3. Source your bashrc file ("source ~/.bashrc")
