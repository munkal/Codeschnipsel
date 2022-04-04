<table class="table">
    <thead>
    <tr>
        <th scope="col">Vorname</th>
        <th scope="col">Nachname</th>
        <th scope="col">Geburtsdatum</th>
    </tr>
    </thead>
    <tbody>

    <?php
    $pdo = new PDO('mysql:host=localhost; dbname=lap_uebung', 'root');

    foreach ($pdo->query('SELECT first_name, last_name, birthday FROM person ORDER BY birthday DESC', PDO::FETCH_ASSOC) as $person) {

        $firstName = $person['first_name'];
        $lastName = $person['last_name'];
        $birthday = $person['birthday'];

        echo "<tr>
            <td>$firstName</td>
            <td>$lastName</td>
            <td>$birthday</td>
            </tr>";
    }
    ?>

    </tbody>
</table>