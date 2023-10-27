<?php include('atas.php'); ?>
<?php if(isset($_GET['data'])){ ?>
<table class="table table-bordered table-hover table-striped">
<tr align="center">
	<td>No</td><td>Nama Lengkap</td>
	<td>Username</td>
	<td>Password</td>
	<td>Opsi</td>
</tr>
<?php $sql="select * from admin";
	$rs=mysql_query($sql);
	$no=1; 
	while($row=mysql_fetch_array($rs)){ ?>
<tr>
	<td align="center"><?php echo $no; ?></td>
	<td><?php echo $row['nmuser']; ?></td>
	<td><?php echo $row['nmlogin']; ?></td>
	<td><?php echo $row['pslogin']; ?></td>
	<td align="center">
		<a class="btn btn-success" href="user.php?edit&id=<?php echo $row[0]; ?>"><i class="icon-edit icon-white"></i></a> 
		<a class="btn btn-danger" href="user.php?delete&id=<?php echo $row[0]; ?>" 
		onclick="return confirm('Yakin Ingin Menghapus..?');"><i class="icon-trash icon-white"></i></a>
	</td>
</tr>
<?php	$no++; } ?>
</table>
<?php } ?>

<?php
	if(isset($_GET['delete'])){
		$id=$_GET['id'];
		$sql="delete from admin where id='$id'";
		mysql_query($sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			window.location="?data"
			//]]>
		</script>';
	}
?>

<?php if(isset($_GET['entri'])){ ?>
<form method="post" action="">
<table class="table table-hover table-striped">
	<tr>
		<td>Nama Lengkap</td><td><input autofocus required type="text" name="nm" value="" /></td>
	</tr>
	<tr>
		<td>Username</td><td><input required type="text" name="nmlogin" value="" /></td>
	</tr>
	<tr>
		<td>Password</td><td><input required type="password" name="pslogin" value="" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td><td>	<input type="submit" class="btn btn-success" name="save" value="SIMPAN" />
							<input type="reset" class="btn btn-danger" name="reset" value="BATAL" />
	</td>
	</tr>
</table>
</form>
<?php	

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

if(isset($_POST['save'])){
		$nm=$_POST['nm'];
		$nmlogin=$_POST['nmlogin'];
		$pslogin=$_POST['pslogin'];
		$encrypted=encrypt($pslogin, $pslogin);
		echo "<script>console.log('encrypted : " . $encrypted . "' );</script>";
		// $sql="insert into admin (id,nmuser,nmlogin,pslogin) values('','$nm','$nmlogin',md5('$pslogin'))";
		$sql="insert into admin (id,nmuser,nmlogin,pslogin) values('','$nm','$nmlogin','$encrypted')";
		mysql_query($sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			alert("Data User Tersimpan");
			window.location="?data"
			//]]>
		</script>';
		}
?>
<?php } ?>

<?php if(isset($_GET['edit'])){ $sql="select * from admin where id='$_GET[id]'";
$rs=mysql_query($sql);
$row=mysql_fetch_array($rs);{
 ?>
<form method="post" action="">
<table class="table table-hover table-striped"> 
	<tr>
		<td>Nama Lengkap</td><td><input type="text" name="nm" value="<?php echo $row[1]; ?>" /></td>
	</tr>
	<tr>
		<td>Username</td><td><input type="text" name="nmlogin" value="<?php echo $row[2]; ?>" /></td>
	</tr>
	<tr>
		<td>Password</td><td><input type="password" name="pslogin" value="" placeholder="Kosongkan Jika Tidak Di Ganti"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td><td>	<input class="btn btn-success"  type="submit" name="save" value="SIMPAN" />
							<input class="btn btn-danger"  type="reset" name="reset" value="BATAL" />
	</td>
	</tr>
</table>
</form>
<?php	 } if(isset($_POST['save'])){
		$nm=$_POST['nm'];
		$nmlogin=$_POST['nmlogin'];
		$pslogin=$_POST['pslogin'];
		if($pslogin==""){
		$sql="update admin set nmuser='$nm',nmlogin='$nmlogin' where id='$_GET[id]'";
		mysql_query($koneksi, $sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			alert("Data User Telah DiUbah");
			window.location="?data"
			//]]>
		</script>';
		}else{
		$sql="update admin set nmuser='$nm',nmlogin='$nmlogin',pslogin=md5('$pslogin') where id='$_GET[id]'";
		mysqli_query($koneksi, $sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			alert("Data User Berhasil diUbah");
			window.location="?data"
			//]]>
		</script>';
		}
}
?>
<?php } ?>
<?php include('bawah.php'); ?>