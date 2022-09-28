#!/usr/bin/php
<?php

function y($m) { 
    # replaces all . with " x " in m
    $m = preg_replace("/\./", " x ", $m);
    
    # replaces all @ with " y" in m`
    $m = preg_replace("/@/", " y", $m);
    return $m;
}

function x($y, $z) {
    # Read the content of a file into variable
    $a = file_get_contents($y); 

    # Call y with the second mached group and save the result
    $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a);
    
    # Replace '[' with '('
    $a = preg_replace("/\[/", "(", $a);
    
    # Replace ']' with ')'
    $a = preg_replace("/\]/", ")", $a);
    return $a;
}

$r = x($argv[1], $argv[2]); 
print $r;

?>