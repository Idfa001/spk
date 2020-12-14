<?php 
include "../koneksi.php";
$kdsakit = $_POST['CmbPenyakit'];
$sqlp = "SELECT * FROM tb_penyakit WHERE id='$kdsakit' ";
$qryp = mysql_query($sqlp);
$datap= mysql_fetch_array($qryp);
$sakit = $datap['nama_penyakit'];
?>
<html>
<head>
<title>Laporan Gejala</title>
<link href="../images/favicon.png" rel="shortcut icon" />
<link rel="stylesheet" href="../style.css" type="text/css" media="screen" />
</head>
<body>

<br>
<table width="650" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#99CC99">
  <tr bgcolor="#CCCC99">
    <td colspan="3"><div align="left" style="background-color:#CCCC99; width:650;"><b>Nama Penyakit : 
  <?php echo $sakit; ?> 
  </b>
</div></td>
  </tr>
  <tr bgcolor="#CCCC99">
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCC99"> 
    <td colspan="3"><b>Daftar Gejala Per Penyakit</b> <br>
      <br></td>
  </tr>
  <tr bgcolor="#CCCC99"> 
    <td width="39" align="center"><b>No</b></td>
    <td width="84"><b>Kode</b></td>
    <td width="361"><b>Nama Gejala</b></td>
  </tr>
  <?php 
	$sqlg  = "SELECT * FROM tb_rules,tb_gejala WHERE tb_rules.id_problem='$kdsakit' AND tb_gejala.id=tb_rules.id_evidence ";
	$qryg = mysql_query($sqlg, $koneksi)or die ("SQL Error".mysql_error());
	$no=0;
	while ($datag=mysql_fetch_array($qryg)) {
	$no++;
  ?>
  <tr bgcolor="#FFFFFF"> 
    <td align="center"><?php echo $no; ?></td>
    <td><?php echo $datag['kdgejala']; ?></td>
    <td><?php echo $datag['gejala']; ?></td>
  </tr>
  <?php
  }
  ?>
   <tr>
  <td colspan="3" bgcolor="#CCCC99"><div align="right"><a href="haladmin.php?top=lapgejala.php">Kembali</a></div> </td>
</tr>
</table>
</body>
</html>
