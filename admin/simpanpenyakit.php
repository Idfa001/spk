<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Simpan Data Penyakit</title>
<link rel="stylesheet" type="text/css" href="../style.css">
<link href="../Image/icon.png" rel="shortcut icon">
</head>
<body>
</body>
</html>
<?php
//include "inc.connect/connect.php";
include "../koneksi.php";
$kdpenyakit=$_POST['kdpenyakit'];
$nama_penyakit=$_POST['nama_penyakit'];
$definisi=$_POST['definisi'];
$solusi=$_POST['solusi'];
//cek keberadaan data
$sqlrs=mysql_query("SELECT kdpenyakit FROM tb_penyakit WHERE kdpenyakit='$kdpenyakit'");
$rs=mysql_num_rows($sqlrs);
if($rs==0){
	$perintah="INSERT INTO tb_penyakit(kdpenyakit,nama_penyakit,definisi,solusi)VALUES('$kdpenyakit','$nama_penyakit','$definisi','$solusi')";
	$berhasil=mysql_query($perintah);
	//jika data berhasil disimpan
	if($berhasil){
		echo"<center>Penyimpanan Berhasil</center><br>";
		echo "<center><a href='../admin/haladmin.php?top=penyakit_solusi.php'>OK</a></center>";
		}else{
		echo"<center><font color='#ff0000'><strong>Penyimpanan Gagal</strong></font></center><br>";
		echo "<center><a href='../admin/haladmin.php?top=penyakit_solusi.php'>Kembali</a></center>";
		}	
	}else{
	echo"<table style='margin-top:150px;' align='center'><tr><td>";
	echo"<div style='width:500px; height:50px auto; border:1px dashed #CCC; color:#F90; padding:3px 3px 3px 3px;'>";
	echo "<center><font>Kode Gejala $kd_gejala <strong>Telah ada di database, Masukkan Kode Unik..!</strong></font></center><br>";
	echo "<center><a href='../admin/haladmin.php?top=penyakit_solusi.php'>Kembali</a></center>";
	echo"</div>";
	echo"</td></tr></table>";
	}
?>