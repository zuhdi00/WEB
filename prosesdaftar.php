<?php 
include "conf/inc.koneksi.php";
	
# Baca variabel Form (If Register Global ON)
$nama 	= $_REQUEST['nama'];
$kelamin 	= $_REQUEST['jk'];
$alamat 	= $_REQUEST['alamat'];
$pekerjaan= $_REQUEST['pekerjaan'];

# Validasi Form
if (trim($nama)=="") {
	include "konsultasi.php";
	echo "Nama belum diisi, ulangi kembali";
}
elseif (trim($alamat)=="") {
	include "konsultasi.php";
	echo "Alamat masih kosong, ulangi kembali";
}
elseif (trim($pekerjaan)=="") {
	include "konsultasi.php";
	echo "Pekerjaan masih kosong, ulangi kembali";
}
else {
    $NOIP = $_SERVER['REMOTE_ADDR'];
	$sqldel = "DELETE FROM tmp_pasien WHERE noip='$NOIP'";
	mysql_query($sqldel, $koneksi);
	
	$sql  = " INSERT INTO tmp_pasien (nama,kelamin,alamat,pekerjaan,noip,tanggal) 
		 	  VALUES ('$nama','$kelamin','$alamat','$pekerjaan','$NOIP',NOW())";
	mysql_query($sql, $koneksi) 
		  or die ("SQL Error 2".mysql_error());
	
	$sqlhapus = "DELETE FROM tmp_solusi WHERE noip='$NOIP'";
	mysql_query($sqlhapus, $koneksi) 
			or die ("SQL Error 1".mysql_error());
	
	$sqlhapus2 = "DELETE FROM tmp_analisa WHERE noip='$NOIP'";
	mysql_query($sqlhapus2, $koneksi) 
			or die ("SQL Error 2".mysql_error());
			
	$sqlhapus3 = "DELETE FROM tmp_gejala WHERE noip='$NOIP'";
	mysql_query($sqlhapus3, $koneksi) 
			or die ("SQL Error 3".mysql_error());
	
	echo "<meta http-equiv='refresh' content='0; url=index.php?page=start'>";
}
?>
