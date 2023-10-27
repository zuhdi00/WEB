<?php
include "conf/inc.koneksi.php";

$NOIP = $_SERVER['REMOTE_ADDR'];

# Periksa apabila sudah ditemukan
// Periksa data solusi di dalam tmp
$sql_cekh = "SELECT * FROM tmp_solusi WHERE noip='$NOIP' GROUP BY kd_solusi";
$qry_cekh = mysql_query($sql_cekh, $koneksi);
$hsl_cekh = mysql_num_rows($qry_cekh);
if ($hsl_cekh == 1) {
	// Apabila data tmp_solusi isinya 1
	$hsl_data = mysql_fetch_array($qry_cekh);
	
	// Memindahkan data tmp ke tabel hasil_analisa
	$sql_pasien = "SELECT * FROM tmp_pasien WHERE noip='$NOIP'";
	$qry_pasien = mysql_query($sql_pasien, $koneksi);
	$hsl_pasien = mysql_fetch_array($qry_pasien);
		// Perintah untuk memindah data
		$sql_in = "INSERT INTO analisa_hasil SET
			nama='$hsl_pasien[nama]',
			kelamin='$hsl_pasien[kelamin]',
			alamat='$hsl_pasien[alamat]',
			pekerjaan='$hsl_pasien[pekerjaan]',
			kd_solusi='$hsl_data[kd_solusi]',
			noip='$hsl_pasien[noip]',
			tanggal='$hsl_pasien[tanggal]'";
			mysql_query($sql_in, $koneksi);
			
		// Redireksi setelah pemindahan data
			echo "<meta http-equiv='refresh' content='0;
			url=index.php?page=result'>";
		exit;
}

# Apabila BELUM MENEMUKAN solusi
$sqlcek = "SELECT * FROM tmp_analisa WHERE noip='$NOIP'";
$qrycek = mysql_query($sqlcek, $koneksi);
$datacek = mysql_num_rows($qrycek);
if ($datacek >= 1) {
	// Seandainya tmp_analisa tidak kosong
	// SQL ambil data gejala yang tidak ada di dalam
	// tabel tmp_gejala (NOT IN....)
	$sqlg = "SELECT gejala.* FROM gejala,tmp_analisa
		WHERE gejala.kd_gejala=tmp_analisa.kd_gejala
		AND tmp_analisa.noip='$NOIP'
		AND NOT tmp_analisa.kd_gejala
		IN(SELECT kd_gejala
			FROM tmp_gejala WHERE noip='$NOIP')
			ORDER BY gejala.kd_gejala LIMIT 1";
	$qryg = mysql_query($sqlg, $koneksi);
	$datag = mysql_fetch_array($qryg);
		
	$kdgejala = $datag['kd_gejala'];
	$gejala = $datag['nm_gejala'];
}
else {
	// Seandainya tmp kosong
	// Ambil data gejala dari tabel gejala
	$sqlg = "SELECT * FROM gejala ORDER BY kd_gejala LIMIT 1";
	$qryg = mysql_query($sqlg, $koneksi);
	$datag = mysql_fetch_array($qryg);
	
	$kdgejala = $datag['kd_gejala'];
	$gejala = $datag['nm_gejala'];
	$geje = "gaul";
}
?>


<div class="panel panel-default">
  <div class="panel-body">
<form action="?page=processcon" method="post" name="form1" target="_self">
	<table class="table" width="100%" border="0" cellpadding="2" cellspacing="1" >
	<tr class="warning">
				<td colspan="2" >JAWABLAH PERTANYAAN BERIKUT :</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><h3><span class="label label-default"> <?php echo "$gejala";?> ? </span></h3>
		
		<input name="TxtKdGejala" type="hidden" value="<?php echo $kdgejala; ?>"></td>
	</tr>
	<tr>
		<td>
			<span class="input-group-addon"><input type="radio" name="RbPilih" value="YA" checked>
			Benar (YA) </span>
			<span class="input-group-addon"><input type="radio" name="RbPilih" value="TIDAK">
			Salah (TIDAK) </span>

			
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="submit" class="btn btn-warning" name="Submit" value="LANJUT >>"></td>
	</tr>
	</table>
</form>

  </div>
</div>
