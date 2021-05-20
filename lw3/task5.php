<?php
header("Content-Type: text/plain");

$email = $_GET["email"] ?? null;

if (!empty($email))
{
    $survey = getData($email);
    if (isset($survey["ERROR"]))
    {
        echo $survey["ERROR"];
    }
    else
    {
        echo (
            "Survey info about " . $survey["email"] . ": \n" .
            "\nFirst Name: " . $survey["first_name"] .
            "\nLast Name: " . $survey["last_name"] .
            "\nEmail: " . $survey["email"] .
            "\nAge: " . $survey["age"]
        );
    }
}
else
{
    echo "Invalid data(no email)";
}

function getData(string $email): array
{
    if (file_exists("../data/$email.txt")){
        $data = file_get_contents("../data/$email.txt");
        return unserialize($data);
    }
    else
    {
        return array("ERROR" => "Survey with email: $email not exists.");
    }
}