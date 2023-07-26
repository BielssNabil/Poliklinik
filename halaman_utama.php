<?php
session_start();
if (empty($_SESSION['Username']) and empty($_SESSION['Password'])) {
	echo "<script type='text/javascript'>
	alert('SILAKAN LOGIN TERLEBIH DAHULU!')
	window.location='index.php';
	</script>";
} else {
?>

	<!doctype html>
	<html>

	<head>
		<meta charset="utf-8">
		<title>Poliklinik Hisyam</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link href='img/logo.png' rel='SHORTCUT ICON' />
	</head>

	<body>

		<div id="luar">
			<div id="welcome">
				&nbsp;&nbsp;Selamat Datang, <b><?php echo $_SESSION['Nama']; ?>&nbsp;(<?php echo $_SESSION['Level']; ?>)</b> <u>
					<font color="white"><a id="logout" href="logout.php" onClick="return confirm('Apakah anda yakin untuk logout, <?php echo $_SESSION['Nama']; ?>?')">Logout</a>
				</u></font>
			</div>

			<div id="header">
			</div>

			<div id="menu">
				<nav>
					<ul>
						<?php
						if ($_SESSION['Level'] != "Pasien") {
						?>
						<?php } ?>
						<?php
						if ($_SESSION['Level'] != "Pasien") {
						?>
							<?php } else { ?>
					
								<?php } ?>
								
								
								</a>
								<?php
								if ($_SESSION['Level'] != "Pasien") {
								?>
									<a href="halaman_utama.php?tabel_pasien=$tabel_pasien">
										<li>PASIEN</li>
									</a>
								<?php } ?>
								<?php if ($_SESSION['Level'] == "Superadmin" or $_SESSION['Level'] == "Admin" or $_SESSION['Level'] == "Pasien") {
								?>
									<a href="halaman_utama.php?tabel_dokter=$tabel_dokter">
										<li>DOKTER</li>
									</a>
								<?php } ?>
								<a href="halaman_utama.php?tabel_poli=$tabel_poli">
									<li>POLI</li>
								</a>
								<?php
								if ($_SESSION['Level'] == "Superadmin") {
								?>
									<a href="halaman_utama.php?tabel_login=$tabel_login">
										<li>ACCOUNT</li>
									</a>
								<?php } else { ?>
									<a href="halaman_utama.php?informasi_akun=$informasi_akun">
										
									</a>
								<?php } ?>
								<a href="halaman_utama.php?home=$home">
									<li>HOME</li>
								</a>
					</ul>
				</nav>
			</div>

			<?php
			$aksi_dokter = "code/proses/update-delete/aksi_dokter.php";
			$aksi_login = "code/proses/update-delete/aksi_login.php";
			$aksi_pasien = "code/proses/update-delete/aksi_pasien.php";
			$aksi_poli = "code/proses/update-delete/aksi_poli.php";
			$home = "home.php";
			$formulir_dokter = "code/formulir/formulir_dokter.php";
			$formulir_login = "code/formulir/formulir_login.php";
			$formulir_pasien = "code/formulir/formulir_pasien.php";
			$formulir_pendaftaran = "code/formulir/formulir_pendaftaran.php";
			$formulir_poli = "code/formulir/formulir_poli.php";
			$informasi_akun = "code/informasi/informasi_akun.php";
			$tabel_dokter = "code/tabel/tabel_dokter.php";
			$tabel_login = "code/tabel/tabel_login.php";
			$tabel_pasien = "code/tabel/tabel_pasien.php";
			$tabel_pendaftaran = "code/tabel/tabel_pendaftaran.php";
			$tabel_poli = "code/tabel/tabel_poli.php";
			?>

			<div id="konten">
				<?php
				if (isset($_GET['home'])) {
					require_once $home;
				} else if (isset($_GET['aksi_dokter'])) {
					require_once $aksi_dokter;
				} else if (isset($_GET['aksi_login'])) {
					require_once $aksi_login;
				} else if (isset($_GET['aksi_pasien'])) {
					require_once $aksi_pasien;
				} else if (isset($_GET['aksi_poli'])) {
					require_once $aksi_poli;
				} else if (isset($_GET['aksi_pendaftaran'])) {
					require_once $aksi_pendaftaran;
				} else if (isset($_GET['formulir_dokter'])) {
					require_once $formulir_dokter;
				} else if (isset($_GET['formulir_login'])) {
					require_once $formulir_login;
				} else if (isset($_GET['formulir_pasien'])) {
					require_once $formulir_pasien;
				} else if (isset($_GET['formulir_pendaftaran'])) {
					require_once $formulir_pendaftaran;
				} else if (isset($_GET['formulir_poli'])) {
					require_once $formulir_poli;
				} else if (isset($_GET['informasi_akun'])) {
					require_once $informasi_akun;
				} else if (isset($_GET['tabel_dokter'])) {
					require_once $tabel_dokter;
				} else if (isset($_GET['tabel_login'])) {
					require_once $tabel_login;
				} else if (isset($_GET['tabel_pasien'])) {
					require_once $tabel_pasien;
				} else if (isset($_GET['tabel_pendaftaran'])) {
					require_once $tabel_pendaftaran;
				} else if (isset($_GET['tabel_poli'])) {
					require_once $tabel_poli;
				}
				?>
			</div>
			<div id="footer">
				<font color="#FFFFFF" size="5px" style="line-height:40px;">Kontak Kami</font>
				<hr width="100%">
				<br>
				<font color="#FFFFFF" style="line-height:35px;"><img src="img/home.png" width="20" height="20" align="center">&nbsp;&nbsp; SMK Negeri 1 Cimahi
					<br>
					<img src="img/telepon.png" width="20" height="20" align="center">&nbsp;&nbsp; +62895375473035
					<br>
					<img src="img/email.png" width="20" height="20" align="center">&nbsp;&nbsp; nabilsatya321@gmail.com
					<br>
					<img src="img/maps.png" width="20" height="30" align="center">&nbsp;&nbsp; Jl. Mahar Martanegara No.48, Utama, Kec. Cimahi Sel., Kota Cimahi, Jawa Barat 40521
				</font>
			</div>
			<div id="copyright">
				<center><font color="black" size="2">Copyright © 2022 Nabil Satya Pramana</font></center>
			</div>
		</div>

	</body>

	</html>

<?php } ?>