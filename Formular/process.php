<?php

$firstName = $_POST['inputFirstName'];
$lastName = $_POST['inputLastName'];
$birthday = $_POST['inputBirthday'];

$now = new DateTimeImmutable();
$birthdate = DateTimeImmutable::createFromFormat('Y-m-d', $birthday);

if (!ctype_alpha($firstName)) {
    echo 'Vorname ist kein akzeptabler Wert!';
    die();
}

if (!ctype_alpha($lastName)) {
    echo 'Nachname ist kein akzeptabler Wert!';
    die();
}

if ($birthdate > $now) {
    echo 'Datum ist nicht valide.';
    die();
}


$pdo = new PDO('mysql:host=localhost; dbname=lap_uebung', 'root');

$pdo->prepare("INSERT INTO person (`first_name`, `last_name`, `birthday`) VALUES (:firstName, :lastName, :birthday)")
    ->execute([
        'firstName' => $firstName,
        'lastName' => $lastName,
        'birthday' => $birthday,
    ]);


header('Location: //localhost/LAP/listing.php', true, 307);

