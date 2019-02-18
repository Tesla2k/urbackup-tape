# urbackup-tape
Shell script for writing UrBackups to tape
Writes all data from specified hosts to tape.

Usage:

  1. Requires: mt, tar, buffer, fuser
  2. urbackup user must be able to write to the tape device
  3. Set Parameters in the script. BACKUPHOSTS is a list of all hosts, that should be written to tape
    
    BACKUPHOSTS="host1 host2"
    TAPEDEVICE=/dev/nst0

  4. Copy the file to /var/urbackup
  
 
Only tested on Ubuntu 18.04 


Todos: 
- Missing check an waiting for inserted tape
- If tape backup fails urbackup should fail too
- Checking the tape finished is only done be the amount of files written to it. So if one host is written multiple times, a other host will be missing. 

 

