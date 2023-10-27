<?php 
include "conf/inc.koneksi.php";
	
# Baca variabel Form (If Register Global ON)
$RbPilih 	= $_REQUEST['RbPilih'];
$TxtKdGejala= $_REQUEST['TxtKdGejala'];

# Mendapatkan No IP
$NOIP 		= $_SERVER['REMOTE_ADDR'];

# Fungsi untuk menambah data ke tmp_analisa
function AddTmpAnalisa($kdgejala, $NOIP) {
	$sql_solusi = "SELECT rule.* FROM rule,tmp_solusi 
				  WHERE rule.kd_solusi=tmp_solusi.kd_solusi 
				  AND noip='$NOIP' ORDER BY rule.kd_solusi,rule.kd_gejala";
	$qry_solusi = mysql_query($sql_solusi);
	while ($data_solusi = mysql_fetch_array($qry_solusi)) {
		$sqltmp = "INSERT INTO tmp_analisa (noip, kd_solusi,kd_gejala)
					VALUES ('$NOIP','$data_solusi[kd_solusi]','$data_solusi[kd_gejala]')";
		mysql_query($sqltmp);
	}
}

# Fungsi hapus tabel tmp_gejala
function AddTmpGejala($kdgejala, $NOIP) {
	$sql_gejala = "INSERT INTO tmp_gejala (noip,kd_gejala) VALUES ('$NOIP','$kdgejala')";
	mysql_query($sql_gejala);
}

# Fungsi hapus tabel tmp_sakit
function DelTmpSakit($NOIP) {
	$sql_del = "DELETE FROM tmp_solusi WHERE noip='$NOIP'";
	mysql_query($sql_del);
}

# Fungsi hapus tabel tmp_analisa
function DelTmpAnlisa($NOIP) {
	$sql_del = "DELETE FROM tmp_analisa WHERE noip='$NOIP'";
	mysql_query($sql_del);
}

# PEMERIKSAAN
if ($RbPilih == "YA") {
	$sql_analisa = "SELECT * FROM tmp_analisa where noip='$NOIP' ";
	$qry_analisa = mysql_query($sql_analisa, $koneksi);
	$data_cek = mysql_num_rows($qry_analisa);
	if ($data_cek >= 1) {
		# Kode saat tmp_analisa tidak kosong
		DelTmpSakit($NOIP);
		$sql_tmp = "SELECT * FROM tmp_analisa 
					WHERE kd_gejala='$TxtKdGejala' 
					AND noip='$NOIP'";
		$qry_tmp = mysql_query($sql_tmp, $koneksi);
		while ($data_tmp = mysql_fetch_array($qry_tmp)) {
			$sql_rsolusi = "SELECT * FROM rule 
							WHERE kd_solusi='$data_tmp[kd_solusi]' 
							GROUP BY kd_solusi";
			$qry_rsolusi = mysql_query($sql_rsolusi, $koneksi);
			while ($data_rsolusi = mysql_fetch_array($qry_rsolusi)) {
				// Data solusi gizi yang mungkin dimasukkan ke tmp
				$sql_input = "INSERT INTO tmp_solusi (noip,kd_solusi)
							 VALUES ('$NOIP','$data_rsolusi[kd_solusi]')";
				mysql_query($sql_input, $koneksi);
			}
		} 
		// Gunakan Fungsi
		DelTmpAnlisa($NOIP);
		AddTmpAnalisa($TxtKdGejala, $NOIP);
		AddTmpGejala($TxtKdGejala, $NOIP);
	}	
	else {
		# Kode saat tmp_analisa kosong
		$sql_rgejala = "SELECT * FROM rule WHERE kd_gejala='$TxtKdGejala'";
		$qry_rgejala = mysql_query($sql_rgejala, $koneksi);
		while ($data_rgejala = mysql_fetch_array($qry_rgejala)) {
			$sql_rsolusi = "SELECT * FROM rule 
						   WHERE kd_solusi='$data_rgejala[kd_solusi]' 
						   GROUP BY kd_solusi";
			$qry_rsolusi = mysql_query($sql_rsolusi, $koneksi);
			while ($data_rsolusi = mysql_fetch_array($qry_rsolusi)) {
				// Data solusi gizi yang mungkin dimasukkan ke tmp
				$sql_input = "INSERT INTO tmp_solusi (noip,kd_solusi)
							 VALUES ('$NOIP','$data_rsolusi[kd_solusi]')";
				mysql_query($sql_input, $koneksi);
			}
		} 
		// Menggunakan Fungsi
		AddTmpAnalisa($TxtKdGejala, $NOIP);
		AddTmpGejala($TxtKdGejala, $NOIP);
	}
	echo "<meta http-equiv='refresh' content='0; url=index.php?page=start'>";
}

if ($RbPilih == "TIDAK") {
	$sql_analisa = "SELECT * FROM tmp_analisa where noip='$NOIP' ";
	$qry_analisa = mysql_query($sql_analisa, $koneksi);
	$data_cek = mysql_num_rows($qry_analisa);
	if ($data_cek >= 1) {
		# Kode saat tmp_analisa tidak kosong
		$sql_rule = "SELECT * FROM tmp_analisa WHERE kd_gejala='$TxtKdGejala'";
		$qry_rule = mysql_query($sql_rule, $koneksi);
		while($hsl_rule = mysql_fetch_array($qry_rule)){
			// Hapus daftar rule yang sudah tidak mungkin dari tabel tmp
			$sql_deltmp = "DELETE FROM tmp_analisa 
							WHERE kd_solusi='$hsl_rule[kd_solusi]' 
							AND noip='$NOIP'";
			mysql_query($sql_deltmp, $koneksi);
			
			// Hapus daftar solusi gizi yang sudah tidak ada kemungkinan
			$sql_deltmp2 = "DELETE FROM tmp_solusi 
						    WHERE kd_solusi='$hsl_rule[kd_solusi]' 
						    AND noip='$NOIP'";
			mysql_query($sql_deltmp2, $koneksi);
		}		
	}
	else {
		# Pindahkan data relsi ke tmp_analisa
		$sql_rule= "SELECT * FROM rule ORDER BY kd_solusi,kd_gejala";
		$qry_rule= mysql_query($sql_rule, $koneksi);
		while($hsl_rule=mysql_fetch_array($qry_rule)){
			$sql_intmp = "INSERT INTO tmp_analisa (noip, kd_solusi,kd_gejala)
						  VALUES ('$NOIP','$hsl_rule[kd_solusi]',
						  '$hsl_rule[kd_gejala]')";
			mysql_query($sql_intmp,$koneksi);
			
			// Masukkan data solusi gizi yang mungkin terjangkit
			$sql_intmp2 = "INSERT INTO tmp_solusi(noip,kd_solusi)
						   VALUES ('$NOIP','$hsl_rule[kd_solusi]')";
			mysql_query($sql_intmp2,$koneksi);				
		}
		
		# Hapus tmp_analisa yang tidak sesuai
		$sql_rule2 = "SELECT * FROM rule WHERE kd_gejala='$TxtKdGejala'";
		$qry_rule2 = mysql_query($sql_rule2, $koneksi);
		while($hsl_rule2 = mysql_fetch_array($qry_rule2)){
			$sql_deltmp = "DELETE FROM tmp_analisa 
						   WHERE kd_solusi='$hsl_rule2[kd_solusi]' 
						   AND noip='$NOIP'";
			mysql_query($sql_deltmp, $koneksi);
			
			// Hapus solusi gizi yang sudah tidak mungkin
			$sql_deltmp2 = "DELETE FROM tmp_solusi 
							WHERE kd_solusi='$hsl_rule2[kd_solusi]' 
							AND noip='$NOIP'";
			mysql_query($sql_deltmp2, $koneksi);
		}
	}
	echo "<meta http-equiv='refresh' content='0; url=index.php?page=start'>";
}
?>
