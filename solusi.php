<?php include('atas.php'); ?>
<?php if(isset($_GET['data'])){ ?>
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example">
<thead>
		<tr>
			<th>No</th>
			<th>Kode Kamar</th>
			<th>Jenis Kamar</th>
			<th>Gambar</th>
			<th>Info Kamar</th>
			<th>Fasilitas yang Mungkin Anda Sukai </th>
			<th>Fitur Lain</th>
			<th>Biaya </th>
			<th>Keterangan Lainnya</th>
			<th>Opsi</th>
		</tr>
	</thead>
<tbody>
<?php
	$sql = "SELECT * FROM solusi ORDER BY kd_solusi";
	$qry = mysql_query($sql, $koneksi)
		or die ("SQL Error".mysql_error());
	$no=0;
	while ($data=mysql_fetch_array($qry)) {
	$no++;
?>
<tr class="odd gradeX">
	<td class="center"><?php echo $no; ?></td>
	<td><?php echo $data['kd_solusi']; ?></td>
	<td><?php echo $data['nm_solusi']; ?></td>
	<td><?php echo $data['solusi']; ?></td>
	<td><?php echo $data['bonus']; ?></td>
	<td><?php echo $data['manfaat']; ?></td>
	<td><?php echo $data['fiturlain']; ?></td>
	<td><?php echo $data['biayadanbunga']; ?></td>
	<td><?php echo $data['syaratpengajuan']; ?></td>
	<td align="center">
	<a title="edit" href="?edit&id=<?php echo $data['kd_solusi']; ?>" class="btn btn-success"><i class="icon-edit icon-white"></i></a>
	<a title="delete" href="?hapus&id=<?php echo $data['kd_solusi']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Mau Hapus..?');" ><i class="icon-trash icon-white"></i></a>
	</td>
</tr>
	<?php
	}
	?>
</tbody>
</table>
<?php } ?>

<?php if(isset($_GET['entri'])){  ?>
<form method="post" action="">
<font face="arial" color="#8f5a1c">
  <table class="table" width="450" border="0" cellpadding="2" cellspacing="1" align="center">
  <tr class="success text-center">
        <td colspan="2" >INPUT DATA KARTU KREDIT</td>
      </tr>
  <tr>
    <td>Kode</td>
    <td><input class="form-control" name="kode" type="text" maxlength="4" size="6" value="<?php echo kdauto("solusi","P"); ?>" disabled="disabled">
    <input class="form-control" name="kode" type="hidden" value="<?php echo kdauto("solusi","P"); ?>"></td>
  </tr>
  <tr>
    <td width="90">Jenis Kamar</td>
    <td width="361">
    <input class="form-control" name="nmsolusi" type="text" value="" size="45" maxlength="100">
    </td>
  </tr>
  <tr>
		<td >Gambar </td>
		<td><input required type="file"  name="solusi" value=""  /></td>
	</tr>
  <tr>
    <td>Info Kamar</td>
    <td><textarea name="bonus" cols="40" rows="4"></textarea></td>
  </tr>
  <tr>
    <td>Fasilitas yang Mungkin Anda Sukai</td>
    <td><textarea name="manfaat" cols="40" rows="4"></textarea></td>
  </tr>
  	<tr>
    <td>Fitur Lain</td>
    <td><textarea name="fiturlain" cols="40" rows="4"></textarea></td>
  </tr>
  <tr>
    <td>Biaya </td>
    <td><textarea name="biayadanbunga" cols="40" rows="4"></textarea></td>
  </tr>
  <tr>
    <td>Keterangan Lainnya</td>
    <td><textarea name="syaratpengajuan" cols="40" rows="4"></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="simpan" value="Simpan" class="btn btn-info"></td>
  </tr>

  </table></font>
</form>
<?php }		
		if(isset($_POST['simpan'])){

		$kode=$_POST['kode'];
		$nmsolusi=$_POST['nmsolusi'];
		$solusi=$_POST['solusi'];
		$bonus=$_POST['bonus'];
		$manfaat=$_POST['manfaat'];
		$fiturlain=$_POST['fiturlain'];
		$biayadanbunga=$_POST['biayadanbunga'];
		$syaratpengajuan=$_POST['syaratpengajuan'];
		
		$sql="insert into solusi (kd_solusi,nm_solusi,solusi,bonus,manfaat,fiturlain,biayadanbunga,syaratpengajuan) values ('$kode','$nmsolusi','$solusi','$bonus','$manfaat','$fiturlain','$biayadanbunga','$syaratpengajuan')";
		mysql_query($sql);

		echo'<script type="text/javascript">
			alert("Data Solusi Baru Disimpan");
			window.location="?data"
		</script>';
		
		}
?>


<?php
	if(isset($_GET['hapus'])){
		$id=$_GET['id'];
		unlink("../news/$nm");
		$sql="delete from solusi where kd_solusi='$id'";
		mysql_query($sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			window.location="?data"
			//]]>
		</script>';
	}
?>


<?php if(isset($_GET['edit'])){ 
$sql="select * from solusi where kd_solusi='$_GET[id]'";
$rs=mysql_query($sql);
$row=mysql_fetch_array($rs);
 } ?>

<form method="POST" action="">
<font face="arial" color="#8f5a1c">
  <table class="table" width="450" border="0" cellpadding="2" cellspacing="1" align="center">
  <tr class="success">
        <td colspan="2" class="center" >EDIT DATA KAMAR DAN SOLUSI</td>
      </tr>
  <tr>
    <td>Kode</td>
    <td><input class="form-control" name="kd" type="text" maxlength="4" size="6" value="<?php echo $row['kd_solusi']; ?>" disabled="disabled">
    	<input name="id" type="hidden" value="<?php echo $row['kd_solusi']; ?>" >
    </td>
 </tr>
  <tr>
    <td width="90">Jenis Kamar</td>
    <td width="361">
    <input class="form-control" name="nm_solusi" type="text" value="<?php echo $row['nm_solusi']; ?>" size="45" maxlength="100">
    </td>
  </tr>
  <tr>
		<td >Gambar </td>
		<td><input required type="file"  name="userfile" value=""  /></td>
	</tr>
  <tr>
    <td>Info Kamar</td>
    <td><textarea name="bonus" cols="40" rows="4"><?php echo $row['bonus']; ?></textarea></td>
  </tr>
  <tr>
    <td>Fasilitas yang Mungkin Anda Sukai</td>
    <td><textarea name="manfaat" cols="40" rows="4"><?php echo $row['manfaat']; ?></textarea></td>
  </tr>
  	<tr>
    <td>Fitur Lain</td>
    <td><textarea name="fiturlain" cols="40" rows="4"><?php echo $row['fiturlain']; ?></textarea></td>
  </tr>
  <tr>
    <td>Biaya </td>
    <td><textarea name="biayadanbunga" cols="40" rows="4"><?php echo $row['biayadanbunga']; ?></textarea></td>
  </tr>
  <tr>
    <td>Keterangan Lainnya</td>
    <td><textarea name="syaratpengajuan" cols="40" rows="4"><?php echo $row['syaratpengajuan']; ?></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="edit" value="Simpan" class="btn btn-info"></td>
  </tr>

   
  </table></font>
</form>

<?php
		
		if(isset($_POST['edit'])){

		$kode=$_POST['kode'];
		$nm_solusi=$_POST['nm_solusi'];
		$bonus=$_POST['bonus'];
		$manfaat=$_POST['manfaat'];
		$fiturlain=$_POST['fiturlain'];
		$biayadanbunga=$_POST['biayadanbunga'];
		$syaratpengajuan=$_POST['syaratpengajuan'];
        $uploaddir = '../news/';
		$fileName = $_FILES['userfile']['name'];     
		$tmpName  = $_FILES['userfile']['tmp_name']; 
		$uploadfile = $uploaddir . $fileName;
		$id=$_POST[id];
		if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {$sql="update solusi set nm_solusi='$nm_solusi', solusi='$userfile', bonus='$bonus', manfaat='$manfaat', fiturlain='$fiturlain', biayadanbunga='$biayadanbunga', syaratpengajuan='$syaratpengajuan' where kd_solusi='$id'";
		mysql_query($sql);

		echo'<script type="text/javascript">
			alert("Data Solusi Berhasil Edit");
			window.location="?data"
		</script>';
	        }ELSE {$sql="update solusi set nm_solusi='$nm_solusi', bonus='$bonus', manfaat='$manfaat', fiturlain='$fiturlain', biayadanbunga='$biayadanbunga', syaratpengajuan='$syaratpengajuan' where kd_solusi='$id'";
		mysql_query($sql);

		echo'<script type="text/javascript">
			alert("Data Solusi Berhasil Edit");
			window.location="?data"
		</script>';}
		
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