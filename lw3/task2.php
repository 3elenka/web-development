<?php
header("Content-Type: text/plain");

echo checkIdentifier($_GET["identifier"]) ?? null;

function checkIdentifier(string $identifier): string
{
    return preg_match("/^[A-Za-z][A-Za-z0-9]*$/", $identifier) ? "yes" : "no, identifier must start with a letter and contain only English letters and numbers";
}