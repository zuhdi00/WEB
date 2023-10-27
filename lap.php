<?php
include "conf/inc.koneksi.php";

# Mendapatkan No IP Lokal
$NOIP = $_SERVER['REMOTE_ADDR'];

# Perintah Ambil data analisa_hasil
$sql = "SELECT analisa_hasil.*, solusi.*
	FROM analisa_hasil,solusi
	WHERE solusi.kd_solusi=analisa_hasil.kd_solusi
	AND analisa_hasil.noip='$NOIP'
	ORDER BY analisa_hasil.id DESC LIMIT 1";
$qry = mysql_query($sql, $koneksi)
	or die ("Query Hasil salam".mysql_error());
$data= mysql_fetch_array($qry);

$sql2 = "SELECT * FROM tmp_pasien WHERE noip='$NOIP'";
$qry2 = mysql_query($sql2, $koneksi)
	or die ("Query Hasil salam".mysql_error());
$data2= mysql_fetch_array($qry2);

# Membuat hasil Pria atau Wanita
if ($data2['kelamin']=="P") {
	$kelamin = "Pria";
}
else {
	$kelamin = "Wanita";
}
?>


<body onload="window.print();" Layout="Portrait">

<table width="100%" border="0" cellpadding="3" cellspacing="1">
	<tr align="center">
		<td colspan="3">
		<font color="#d1ad2e"><b>HASIL REKOMENDASI JENIS PELAYANAN YANG SESUAI</b></font><hr color="#d1ad2e" ></td>
	</tr>
	<tr>
		<td colspan="3"><b>DATA PELANGGAN:</b></td>
	</tr>
	<tr>
		<td width="86">Nama </td><td> : </td>
		<td width="689"> <?php echo $data2['nama']; ?></td>
	</tr>
	<tr>
		<td>Kelamin </td><td> : </td>
		<td> <?php echo $kelamin; ?></td>
	</tr>
	<tr>
		<td>Alamat </td><td> : </td>
		<td> <?php echo $data2['alamat']; ?></td>
	</tr>
	<tr>
		<td>Pekerjaan </td><td> : </td>
		<td> <?php echo $data2['pekerjaan']; ?></td>
	</tr>
	</table>
	<table width="100%" border="0" cellpadding="2" cellspacing="1">
	<tr>
		<td colspan="2"><b>HASIL ANALISA TERAKHIR:</b></td>
	</tr>
	<tr>
		<td width="86">Jenis Kamar </td>
		<td width="689"><?php echo $data['nm_solusi']; ?></td>
	</tr>

	<tr>
		<td valign="top">Gejala </td>
		<td>
		<?php
		# Menampilkan Daftar Gejala
	$sql_gejala = "SELECT gejala.* FROM gejala,rule
		WHERE gejala.kd_gejala=rule.kd_gejala
		AND rule.kd_solusi='$data[kd_solusi]' order by gejala.kd_gejala";
	$qry_gejala = mysql_query($sql_gejala, $koneksi);
	$i=0;
	while ($hsl_gejala=mysql_fetch_array($qry_gejala)) {
	$i++;
		echo "$i . $hsl_gejala[nm_gejala] <br>";
	}
?>
		</td>
	</tr>
	<tr>
		<td valign="top">Info Kamar </td>
		<td><?php echo $data['bonus']; ?></td>
	</tr>
	<tr>
		<td valign="top">Fasilitas yang Mungkin Anda Sukai </td>
		<td><?php echo $data['manfaat']; ?></td>
	</tr>
	<tr>
		<td valign="top">Fitur Kamar </td>
		<td><?php echo $data['fiturlain']; ?></td>
	</tr>
	<tr>
		<td valign="top">Biaya </td>
		<td><?php echo $data['biayadanbunga']; ?></td>
	</tr>
	<tr>
		<td valign="top">Keterangan Lainnya </td>
		<td><?php echo $data['syaratpengajuan']; ?></td>
	</tr>


</table>

</body>
