# bugbuntu-setup
🛠️ This tool replicates the exact setup found in the BugBounty OS (BugBuntu), making it easy to deploy the same environment on any system.


Make the script executable by running the command:

chmod +x setup.sh

Run the script with:

    ./setup.sh

Key Notes:

    Reboots: The script contains several places where the system is rebooted. These will happen after certain installations (like lightdm and XFCE).

    Permissions: The script assumes you have sudo privileges to run these commands.

    Adjustments: Some commands may need to be modified depending on your system setup (e.g., paths, usernames).
