<?php
include "../../../koneksi.php";
$KodeDokter = $_POST['KodeDokter'];
$NamaDokter = $_POST['NamaDokter'];
$JadwalPraktek = $_POST['JadwalPraktek'];
$AlamatDokter = $_POST['AlamatDokter'];
$TeleponDokter = $_POST['TeleponDokter'];
$KodePoli = $_POST['KodePoli'];

$insertDokter = "INSERT INTO dokter values ('$KodeDokter','$NamaDokter','$JadwalPraktek','$AlamatDokter','$TeleponDokter','','$KodePoli')";

$insertDokter_query = mysqli_query($connect,$insertDokter);

if ($insertDokter_query)
{
	header('location:../../../halaman_utama.php?tabel_dokter=$tabel_dokter');
}
else
{
	echo "Insert gagal dijalankan";
}

?>