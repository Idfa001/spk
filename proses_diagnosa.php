<html>
<title>PakarSindroma|DS</title>
<body>
<?php include "koneksi2.php"; ?>
<table width="750" border="1" align="center">
  <tr>
    <td width="786"><h3>PROSES DIAGNOSA PENYAKIT GIGI</h3><strong>Pilihlah Gejala Yang Anda Alami..!</strong></td>
  </tr>
  <tr>
    <td>
<form method="post">
<?php
//-- menampilkan daftar gejala
$arrKDGejala=array();
$sql="SELECT * FROM tb_gejala  ";
$result=$db->query($sql);
while($row=$result->fetch_object()){
	echo "<input type='checkbox' name='evidence[]' value='{$row->id}'> {$row->kdgejala} | {$row->gejala}<br>";
	$arrKDGejala[]=$row->gejala;
}
?><br>
<center><input type="submit" value="Proses Diagnosa Penyakit"></center>
</form>
<?php
if(isset($_POST['evidence'])){
	if(count($_POST['evidence'])<2){
		echo "Pilih minimal 2 gejala";
	}else{
		echo "<div class='form'><p>Gejala Yang dipilih :</p>".$_POST['evidence'];
		echo implode(',',$_POST['evidence'])."</div>";
		$sql = "SELECT GROUP_CONCAT(b.kdpenyakit), a.cf
			FROM tb_rules a
			JOIN tb_penyakit b ON a.id_problem=b.id
			WHERE a.id_evidence IN(".implode(',',$_POST['evidence']).") 
			GROUP BY a.id_evidence";
		$result=$db->query($sql);
		$evidence=array();
		$gejalaSelect=array();
		while($row=$result->fetch_row()){
			$evidence[]=$row;
			$gejalaSelect[]=$row[0];
		} $no=0;
		echo "<div class='form'><p>Densitas (m) Awal<p>";
		echo "<table border='1' width='100%'>";
		echo "<tr>";
		echo "<td><strong>No</strong></td>";
		echo "<td><strong>Gejala</strong></td>";
		echo "<td><strong>Penyakit</strong></td>";
		echo "<td><strong>Densitas</strong></td>";
		echo "<td><strong>Plausability</strong></td>";
		echo "</tr>";
		foreach($evidence as $kdgejala){
			echo "<tr>"; $no=$no+1;
			echo "<td>$no</td>";
			echo "<td>";  echo"</td>";
			echo "<td>"; print_r($kdgejala[0]); echo "</td>";
			echo "<td>"; print_r($kdgejala[1]); echo"</td>";
			echo "<td>"; print_r(1-$kdgejala[1]); echo"</td>"; echo "</tr>";
			}unset($kdgejala);
		echo "</table>";
		echo "</div>";
		//-- masukkan kode perhitungannya di sini
		//--- menentukan environement
		$sql="SELECT GROUP_CONCAT(kdpenyakit) FROM tb_penyakit";
		$result=$db->query($sql);
		$row=$result->fetch_row();
		$fod=$row[0];
		echo "M<sub>2</sub>{".$fod."}<br>";
		//--- menentukan nilai densitas
		$densitas_baru=array(); 
echo "<table border='1' width='750'>";
		while(!empty($evidence)){ 
echo "<tr>";
		//nilai pada Y1 baris atas
		echo "<td width='250'>&nbsp;</td>";
		echo "<td width='250'>";
			$densitas1[0]=array_shift($evidence); 
			echo "<span class='Y1'>M<sub>2</sub> y1"; echo "{"; print_r($densitas1[0][0]); echo "}<br>";
			print_r($densitas1[0][1]); 
			echo "</span>";
		echo "</td>";
		echo "<td width='250'>";
		//nilai pada Y2 baris atas
			$densitas1[1]=array($fod,1-$densitas1[0][1]); 
			echo "<span class='Y2'>M<sub>y2</sub>{&theta;}<br>"; $Y2=1-$densitas1[0][1]; echo " $Y2</span>";
			$densitas2=array();
		echo "</td></tr>";
		echo "<tr>";
		echo "<td>";
			if(empty($densitas_baru)){
				//nilai pada X1 baris 1
				//echo "tidak ada densitas baru<br>";
				$densitas2[0]=array_shift($evidence);
				echo "<span class='X1'>M<sub>1</sub>";
				echo "{"; print_r($densitas2[0][0]); echo "}<br>";
				echo ""; print_r($densitas2[0][1]); echo "<br>";
				 echo "</span><br>"; 
			}else{
				foreach($densitas_baru as $k=>$r){
					//nilai pada X1 baris 2; jika ad densitas baru
					if($k!="&theta;"){
						$densitas2[]=array($k,$r); 
						//echo "<span class='X1'>[nilai X1 baris 2 ";
						echo "<span class='X1'>m<sub>$m</sub>{";
						//print_r($densitas2[0][0]); echo "<br>";
						//print_r($densitas2[0][1]);
						print_r($k); echo"}<br>"; print_r($r);
						echo "</span>";
					}
				}
			}
		echo "</td>"; //bagian y1
		echo "<td valign='top' colspan='2' rowspan='2'>&nbsp;</td>";
		echo "</tr>";
		echo "<tr>";
		echo "<td valign='top'>";
			$theta=1;
			//nilai X1 baris 2 teta
			foreach($densitas2 as $d) $theta-=$d[1]; echo "<span class='X2'>M<sub>$m</sub>{&theta;}<br>".$theta."</span>";
			$densitas2[]=array($fod,$theta); 
			//print_r($theta);
			//echo"<p>densitas2[0] = ".print_r($densitas2[0][0])." | densitas2[1] = ".print_r($densitas2[0][1])."</p>";
			$m=count($densitas2); echo "count data M = $m";
		echo "</td>";
		//echo "<td colspan='2'>y2&nbsp;</td>"; 
		echo "</tr>";
		echo "<tr>"; 
		echo "<td>x2&nbsp;</td>"; 
		echo "<td colspan='2' valign='top'><div class='kolom2X'>";
			$densitas_baru=array();
			for($y=0;$y<$m;$y++){
				for($x=0;$x<2;$x++){
					if(!($y==$m-1 && $x==1)){
						$v=explode(',',$densitas1[$x][0]);
						$w=explode(',',$densitas2[$y][0]);
						sort($v); 
						sort($w); 
						$vw=array_intersect($v,$w);  //mencari nilai irisan
						//echo "<br><strong>|| irisan X "; foreach($v as $v1){ print_r($v1);} echo " Dengan Y "; foreach($w as $w1){ print_r($w1);} echo" hasil = "; foreach($vw as $vwHasil){ print_r($vwHasil);} 
										//echo "<br>Data X = "; print_r($densitas1[$x][1]);
										//echo "<br>Data Y = "; print_r($densitas2[$y][1]);
										
										//echo "||</strong><br>";	
						if(empty($vw)){
							//echo "<td valign='top' colspan='2' rowspan='2' >ddddddddddddddd";
							echo "<span class='densitas'>kosong";
							$k="&theta;"; echo " $k<br>";
							echo $nilaiX1Y1;
							echo "</span>"; 
						}else{
							
							//echo "<td rowspan='2'>";
							//echo "<br><span class='teta2'>jika data vw ADA maka tampilkan ";
							$k=implode(',',$vw); //echo "{".print_r($k)."}= $nilaiX1Y1"; 
							//echo "</span>"; //echo "</td>";
							echo "<span class='densitas'>";
										$nilaiX1Y1=$densitas1[$x][1]*$densitas2[$y][1]; 
										foreach($vw as $vwHasil){ print_r($vwHasil);} echo "<br>"; print_r($nilaiX1Y1);
										echo "</span>";
						}
						if(!isset($densitas_baru[$k])){
							//data Y1r2
							//echo "<td> y1 r3 ";
							$densitas_baru[$k]=$densitas1[$x][1]*$densitas2[$y][1];
							//echo "<span class='Y1r2'>Y1r2 = "; 
							$k=implode(',',$vw); //echo $k. "<br>"; 
							
							//print_r($densitas_baru[$k]); echo "<br>";
							//echo "</span>";
							//echo "</td>";
							//echo "<td> y2 r3<span class='Y2r2'>d</span></td>";
							//echo "<p>M <sub>3a</sub> {"; print_r($densitas_baru[$k]); echo"}="; print_r($densitas1[$x][1]); print_r($densitas2[$y][1]); echo "</p>";
						}else{
							$densitas_baru[$k]+=$densitas1[$x][1]*$densitas2[$y][1];
							//echo "<p>M <sub>3b</sub> : "; print_r($densitas_baru[$k]);echo"|"; print_r($densitas1[$x][1]); print_r($densitas2[$y][1]); echo "</p>";
						}
					}
				} 
			}	echo "<span class='densitas'>&theta;<br>"; $dataX2=$theta; $dataY2=$Y2; $Y3=$dataX2*$dataY2; echo $Y3."</span>";
echo "</div></td></tr>";
echo "<tr>";
echo "<td colspan='3'>";
			echo "<div >";
			echo "<p style='font-weight:bold; border:none;'>&nbsp;</p>";
			foreach($densitas_baru as $k=>$d){
				if($k!="&theta;"){
					$densitas_baru[$k]=$d/(1-(isset($densitas_baru["&theta;"])?$densitas_baru["&theta;"]:0));
					//echo "<p>Densitas baru "; print_r($densitas_baru[$k]); echo"=$d /(1-";  echo "</p>";
					//print_r((1-(isset($densitas_baru["&theta;"])?$densitas_baru["&theta;"]:0))); echo "<br>";
					//print_r($densitas_baru["&theta;"]); echo "<br>";
					echo "m<sub>$m</sub>{"; print_r($k); echo "} =$d /(1-(";print_r($d);echo "<br>";
					echo "m<sub>$m</sub>{"; print_r($k); echo "} = ";print_r($densitas_baru[$k]); echo "<br>";
				}
			}
			echo "</div>";
			echo "<p style='font-weight:bold; border:none;'>Sehingga dari perhitungan #5 didapatkan :</p>";
			//print_r($densitas_baru);
			foreach($densitas_baru as $kdPdensitas=>$nilaiPDensitas){
				echo "m<sub>11</sub>("; print_r($kdPdensitas); echo ") = "; print_r($nilaiPDensitas); echo "<br>";
				}
echo "</td></tr>";
		}
echo "</table>";
		//--- perangkingan
		unset($densitas_baru["&theta;"]);
		arsort($densitas_baru);
		//echo "<p>Densitas Baru : ";
		echo "<h2>Hasil Perangkingan</h2>";
		echo "<p style='font-weight:bold; border:none;'>Dari hasil perhitungan yang terakhir tersebut kemudian diurutkan nilainya dari yang terbesar ke yang terkecil sebagai berikut :</p>";
		//print_r($densitas_baru);
		foreach($densitas_baru as $kdpenyakit=>$ranking){
			echo "m<sub>$m</sub>("; print_r($kdpenyakit); echo ") = "; print_r($ranking); echo "<br>";
			}
		//echo "</p>";
		//--- menampilkan hasil akhir
		$codes=array_keys($densitas_baru);
		echo "<p>implode codes</p>";
		print_r(implode("','",$codes)."'");
		echo "<hr>";
		$sql="SELECT GROUP_CONCAT(nama_penyakit) 
			FROM tb_penyakit 
			WHERE kdpenyakit IN('".implode("','",$codes)."')"; 
		$result=$db->query($sql);
		$row=$result->fetch_row();
		echo "Terdeteksi penyakit <b>{$row[0]}</b> dengan derajat kepercayaan ".round($densitas_baru[$codes[0]]*100,2)."%";
	}
}
?></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>