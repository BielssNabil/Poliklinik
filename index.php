<!doctype html>
<html>

<head>
	<title>Login Poliklinik</title>
	<link href='img/logo.png' rel='SHORTCUT ICON' />
</head>

<index>
	<link rel="stylesheet" type="text/css" href="css/style2.css" />

	<body background="img/walpaper.jpg">
		<center>
			<font size="5px" face="Calibri" color="black">Hisyam Poliklinik<br></font>
			<br>

			<form action="cekLogin.php" method="post" class="expose">
				<fieldset>
					<br>
					<img src="img/logo.png" width="130" height="140">
					<br><br>
					<input type="text" size="25px" name="Username" maxlength="20" placeholder="Inputkan Username" required><br /><br>
					<input type="password" size="25px" name="Password" id="password" maxlength="20" placeholder="Inputkan Password" required><br /><br />
					<input type="submit" class="tombol" name="login" value="" style="background-image:url(img/tick.png); background-position:center; background-size:8%; background-repeat:no-repeat;">
					<br><br>
				</fieldset>
			</form>
		</center>
	</body>
</index>

</html>