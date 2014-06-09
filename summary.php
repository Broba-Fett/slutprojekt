<?php
$dbhost = "localhost";
$dbname = "summary";
$dbuser = "root";
$dbpassword = "";
$attr = array(PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC);
$pdo = new PDO("mysql:host=$dbhost;dbname=$dbname;charset=utf8mb4", $dbuser, $dbpassword, $attr);


$summary_id = filter_input(INPUT_GET, 'summary_id', FILTER_VALIDATE_INT);

?>

<!DOCTYPE html>
<html>
<head>
	<title>Sammanfattning</title>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<?php
	$statement = $pdo->prepare('SELECT * FROM summaries WHERE id = :summary_id');
	$statement->bindParam(':summary_id', $summary_id, PDO::PARAM_INT);
	$statement->execute();
	$result = $statement->fetch();
	?>
	<h2><?php echo $result['title']; ?></h2>
	<p><?php echo $result['content']; ?></p>
	<p><?php echo "Upplagt {$result['date']} av {$result['author_name']}"; ?></p>
	<?php echo "<a href=\"summaries.php?subject_id={$result['subject_id']}\">Gå tillbaka</a>"; ?>
</body>
</html>