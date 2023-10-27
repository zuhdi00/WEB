<?php
session_start();
include_once "inc.koneksi.php";

$TxtUser = $_REQUEST['TxtUser'];
$TxtPasswd = $_REQUEST['TxtPasswd'];

if (trim($TxtUser)=="") {
	echo "DATA USER BELUM DIISI";
	include "index.php"; exit;
}
elseif (trim($TxtPasswd)=="") {
	echo "DATA PASSWORD BELUM DIISI";
	include "index.php"; exit;
}

// SQL untuk memeriksa data User dan Password
$encrypted = encrypt($TxtPasswd, $TxtPasswd);
$sql_cek = "SELECT * FROM admin WHERE nmlogin='$TxtUser'
	AND pslogin='$encrypted'";
$qry_cek = mysql_query($sql_cek, $koneksi)
	or die ("Gagal Cek".mysql_error());
$ada_cek = mysql_num_rows($qry_cek);

// Periksa apakah ada data yang sesuai
if ($ada_cek >=1) {
	$SES_USER=$TxtUser;
	$_SESSION[SES_USER]= $SES_USER;
	
	header ("location: admin.php");
	exit;
}
else {
	echo "USER DAN PASSWORD TIDAK SESUAI";
	include "index.php";
	exit;
}

// function to encrypt the text given
function encrypt($pswd, $text)
{
	// change key to lowercase for simplicity
	$pswd = strtolower($pswd);
	
	// intialize variables
	$code = "";
	$ki = 0;
	$kl = strlen($pswd);
	$length = strlen($text);
	
	// iterate over each line in text
	for ($i = 0; $i < $length; $i++)
	{
		// if the letter is alpha, encrypt it
		if (ctype_alpha($text[$i]))
		{
			// uppercase
			if (ctype_upper($text[$i]))
			{
				$text[$i] = chr(((ord($pswd[$ki]) - ord("a") + ord($text[$i]) - ord("A")) % 26) + ord("A"));
			}
			
			// lowercase
			else
			{
				$text[$i] = chr(((ord($pswd[$ki]) - ord("a") + ord($text[$i]) - ord("a")) % 26) + ord("a"));
			}
			
			// update the index of key
			$ki++;
			if ($ki >= $kl)
			{
				$ki = 0;
			}
		}
	}

	// return the encrypted code
	return $text;
}

// function to decrypt the text given
function decrypt($pswd, $text)
{
	// change key to lowercase for simplicity
	$pswd = strtolower($pswd);
	
	// intialize variables
	$code = "";
	$ki = 0;
	$kl = strlen($pswd);
	$length = strlen($text);
	
	// iterate over each line in text
	for ($i = 0; $i < $length; $i++)
	{
		// if the letter is alpha, decrypt it
		if (ctype_alpha($text[$i]))
		{
			// uppercase
			if (ctype_upper($text[$i]))
			{
				$x = (ord($text[$i]) - ord("A")) - (ord($pswd[$ki]) - ord("a"));
				
				if ($x < 0)
				{
					$x += 26;
				}
				
				$x = $x + ord("A");
				
				$text[$i] = chr($x);
			}
			
			// lowercase
			else
			{
				$x = (ord($text[$i]) - ord("a")) - (ord($pswd[$ki]) - ord("a"));
				
				if ($x < 0)
				{
					$x += 26;
				}
				
				$x = $x + ord("a");
				
				$text[$i] = chr($x);
			}
			
			// update the index of key
			$ki++;
			if ($ki >= $kl)
			{
				$ki = 0;
			}
		}
	}
	
	// return the decrypted text
	return $text;
}

?>