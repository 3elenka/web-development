<?php
header("Content-Type: text/plain");

if (isset($_GET["email"]))
{
    $email = $_GET["email"];
    $survey = getSurvey();
    saveSurvey($survey);
    echo "Survey saving is complete";
}
else
{
    echo "Invalid survey info(no email)";
}

function getSurvey(): array
{
    return [
        "email" => $_GET["email"],
        "first_name" => $_GET["first_name"] ?? "",
        "last_name" => $_GET["last_name"] ?? "",
        "age" => $_GET["age"] ?? ""
    ];
}

function saveSurvey(array $survey)
{
    $data = serialize($survey);
    $email = $survey["email"];
    if (!is_dir("../data"))
    {
        mkdir("../data");
    }
    file_put_contents("../data/$email.txt", $data);
}