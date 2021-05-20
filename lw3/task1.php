<?php

header("Content-Type: text/plain");

echo removeExtraBlanks($_GET["text"]) ?? null;

function removeExtraBlanks(string $text): string
{
    return preg_replace('/\s\s+/', ' ', trim($text));
}