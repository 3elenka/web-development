<?php
header("Content-Type: text/plain");

echo calcPasswordStrength($_GET["password"]) ?? null;

function calcPasswordStrength(string $password): int
{
    $strength = 0;
    $length = strlen($password);
    $strength += $length * 4;
    $strength += preg_match_all("/[0-9]/", $password) * 4;
    $strength += ($length - preg_match_all("/[A-Za-zА-Яа-я]/", $password)) * 2;
    $strength -= (preg_match_all("/[A-Za-zА-Яа-я]/", $password) === 0) * $length;
    $strength -= (preg_match_all("/[0-9]/", $password) === 0) * $length;
    foreach (count_chars($password, 1) as $count)
    {
        if ($count > 1)
        {
            $strength -= $count;
        }
    }
    return $strength;
}