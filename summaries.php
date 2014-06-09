<?php
$dbhost = "localhost";
$dbname = "summary";
$dbuser = "root";
$dbpassword = "";
$attr = array(PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC);
$pdo = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpassword, $attr);


$subject_id = filter_input(INPUT_GET, 'subject_id', FILTER_VALIDATE_INT);
if (!empty($_POST)) {
	$_POST = null;
	
	$new_title = filter_input(INPUT_POST, 'new_title', FILTER_SANITIZE_STRING);
	$new_text = filter_input(INPUT_POST, 'new_text', FILTER_SANITIZE_STRING);
	$new_author = filter_input(INPUT_POST, 'new_author', FILTER_SANITIZE_STRING);
	if (isset($new_title) && isset($new_text) && isset($new_author)) {
		$statement = $pdo->prepare('INSERT INTO summaries (title, author_name, content, subject_id, date) VALUES (:title, :author_name, :content, :subject_id, :date)');
		$statement->bindParam(':title', $new_title, PDO::PARAM_STR);
		$statement->bindParam(':author_name', $new_author, PDO::PARAM_STR);
		$statement->bindParam(':content', $new_text, PDO::PARAM_STR);
		$statement->bindParam(':subject_id', $subject_id, PDO::PARAM_INT);
		$statement->bindParam(':date', date("Y-m-d h:i:s"), PDO::PARAM_STR);
		$statement->execute();
	}

}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Sammanfattningar</title>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<h2>Lägg till ny sammanfattning</h2>

	<a href="#" class="new">Lägg till sammanfattning</a>
	<?php echo "<form id=\"form\" action=\"summaries.php?subject_id={$subject_id}\" method=\"post\">"; ?>
		Titel: <input type="text" name="new_title"><br>
		Text: <input type="text" name="new_text"><br>
		Ditt namn: <input type="text" name="new_author"><br>
		Ämne: <select>
			<?php
			$statement = $pdo->prepare('SELECT * FROM subjects');
			$statement->execute();
			foreach ($statement->fetchAll() as $row) {
				echo "<option value=\"{$row['id']}\">{$row['name']}</option>";
			}
			?>
		</select>
		<input type="submit" />
	</form>
	<h2>Sammanfattningar</h2>
	<?php
	$statement = $pdo->prepare('SELECT * FROM summaries WHERE subject_id = :subject_id');
	$statement->bindParam(':subject_id', $subject_id, PDO::PARAM_INT);
	$statement->execute();
	foreach ($statement->fetchAll() as $row) {
		echo "<a href=summary.php?summary_id={$row['id']}>{$row['title']}</a>, {$row['date']} av {$row['author_name']}<br />";
	}
	?>
<script>
$(function(){
    $('a.new').click(function(){
        $('#form ').toggle();
    });

});
</script>
</body>
</html>