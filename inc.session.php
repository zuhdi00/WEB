<?php
if (!isset($_SESSION)) {

session_start();

}

if(! ($_SESSION['SES_USER'])) {
	echo "<div align=center><b> PERHATIAN! </b><br>";
	echo "AKSES DITOLAK, PAKAR BELUM LOGIN</div>";
	include "index.php";
	exit;
}
?>