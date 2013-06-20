#!/bin/bash

winExec() {
  VBoxManage guestcontrol "$VMNAME" exec --image "$1" --username IEUser --password $VMPASSWORD --verbose --wait-exit -- "$2" "$3" "$4" >> $LOG_FILE 2>&1
  #vmrun -T fusion -gu misko -gp heslo runProgramInGuest "$VMPATH" -activeWindow -interactive "$1" $2 $3 $4 >> $LOG_FILE 2>&1
}

killIe() {
  winExec C:\\Windows\\system32\\taskkill.exe /IM iexplore.exe /F
}

trap "killIe; exit 0" EXIT

echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE

captureUrl=$1
winExec "C:\\Program Files\\Internet Explorer\\iexplore.exe" ${captureUrl/localhost/10.0.0.200}
