<!DOCTYPE html>
<html>
<body>

<h2>Suche</h2>

<form action="/Snowboard_Search.php" method="POST">
  <label for="id">Id:</label><br>
  <input type="text" id="id" name="id" ><br>
  

<input type="radio" id="now" name="month" value="now">
<label for="now">now</label><br>
<input type="radio" id="all" name="month" value="all">
<label for="all">all</label>

  <input type="submit" value="Submit">
</form> 

</body>
</html>

<?php

$id=$_POST['id'];
$State = $_POST['month'];

if(!isset($_POST['fname'])){
	
	echo "Keine Userid eingegeben";
	
}
elseif (!isset($_POST['Status'])){
	
	echo "Keine Statusangabe vorhanden";
	
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "snowboard";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "select * from snowboard.verleihvorgang where snowboard.verleihvorgang.Kunde_idKunde = $id;";

if(str_contains('now', $State)){
	
	$sql = "select * from snowboard.verleihvorgang where snowboard.verleihvorgang.Kunde_idKunde = 1 and verleihvorgang.Entlehnungszeit like '2022%';";
	
}
if ($State == 1) $sql .= " and Rueckgabedatum = null";
$result = $conn->query($sql);

    $data = $result->fetch_all(MYSQLI_ASSOC);
    
    echo '<table>';
    // Display table header
    echo '<thead>';
    echo '<tr>';
    foreach ($result->fetch_fields() as $column) {
        echo '<th>'.htmlspecialchars($column->name).'</th>';
    }
    echo '</tr>';
    echo '</thead>';
    // If there is data then display each row
    if ($data) {
        foreach ($data as $row) {
            echo '<tr>';
            foreach ($row as $cell) {
                echo '<td>'.htmlspecialchars($cell).'</td>';
            }
            echo '</tr>';
        }
    } else {
        echo '<tr><td colspan="'.$result->field_count.'">No records in the table!</td></tr>';
    }
    echo '</table>';



$conn->close();



?>