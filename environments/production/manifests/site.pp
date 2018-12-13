node 'client.marc.org'{

#include lamp

$proftpd_chroot         =  false
$proftpd_port           =  21
$proftpd_maxinstances   =  25

include ssh
include proftpd
include motd

}
