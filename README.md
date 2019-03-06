# urbackup-tape
PHP script for writing UrBackups to tape.
Writes all data from specified hosts to tape.

Usage:

  1. Requires: php, mysql, mt-gnu, mt-st, tar, buffer
  2. urbackup user must be able to write to the tape device. (This was a bit tricky, it only worked, when a made tape the main group of user urbackup)
  3. Set Parameters in the script. Tapedevice, MySQL and optional additional Directories to include in the backup
    
    $config['tapedevice']="/dev/nst0";
    $config['server']="localhost";
    $config['username'] = "tape_backup";
    $config['password'] = "<password>";
    $config['db'] = "tape_backup";
    
    //Optional:
    $config['additionalDirs'][<label>]=<dir>;

  4. The Urbackup user must be able to sudo tapeinfo. Add the following line with visudo:
  
    urbackup      ALL = NOPASSWD: /usr/sbin/tapeinfo
     

  5. Copy the file to /var/urbackup
  
 
Only tested on Ubuntu 18.04 


Todos: 
- Flush messages so you can see them in the live protocol when they are printed not after the script is finished.
- Show progress every x seconds

Done:
- Missing waiting for inserted tape.
- If tape backup fails urbackup should fail too. 

