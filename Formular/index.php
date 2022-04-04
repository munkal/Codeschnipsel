<?php

include_once 'templates/header.php';


?>


<form action="/LAP/process.php" method="post">
    <div class="mb-3">
        <label for="inputFirstName" class="form-label">Vorname</label>
        <input type="text" class="form-control" id="inputFirstName" name="inputFirstName">
    </div>
    <div class="mb-3">
        <label for="inputLastName" class="form-label">Nachname</label>
        <input type="text" class="form-control" id="inputLastName" name="inputLastName">
    </div>
    <div class="mb-3">
        <label for="inputBirthday" class="form-label">Geburtsdatum</label>
        <input type="date" class="form-control" id="inputBirthday" name="inputBirthday">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>


<?php

include_once 'templates/footer.php';