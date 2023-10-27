<?php include('atas.php'); ?>
<?php if(isset($_GET['data'])){ ?>
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example">
<thead>
		<tr>
			<th>No</th>
			<th>Kode Kriteria</th>
			<th>Nama Nama Kriteria</th>
			<th>Opsi</th>
		</tr>
	</thead>
<tbody>
<?php
	$sql = "SELECT * FROM gejala ORDER BY kd_gejala";
	$qry = mysql_query($sql, $koneksi)
		or die ("SQL Error".mysql_error());
	$no=0;
	while ($data=mysql_fetch_array($qry)) {
	$no++;
?>
<tr class="odd gradeX">
	<td class="center"><?php echo $no; ?></td>
	<td><?php echo $data['kd_gejala']; ?></td>
	<td><?php echo $data['nm_gejala']; ?></td>
	<td align="center">
	<a title="edit" href="?edit&id=<?php echo $data['kd_gejala']; ?>" class="btn btn-success"><i class="icon-edit icon-white"></i></a>
	<a title="delete" href="?hapus&id=<?php echo $data['kd_gejala']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Mau Hapus..?');" ><i class="icon-trash icon-white"></i></a>
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
        <td colspan="2" >INPUT KRITERIA</td>
      </tr>
  <tr>
    <td>Kode</td>
    <td><input class="form-control" name="kode" type="text" maxlength="4" size="6" value="<?php echo kdauto("gejala","G"); ?>" disabled="disabled">
    <input class="form-control" name="kode" type="hidden" value="<?php echo kdauto("gejala","G"); ?>"></td>
  </tr>
  <tr>
    <td width="90"> Kriteria</td>
    <td width="361">
	<textarea name="nmgejala" cols="10" rows="2"></textarea>
    <!--- <input class="form-control" name="nmgejala" type="text" value="" size="45" maxlength="100"> -->
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="simpan" value="Simpan" class="btn btn-success"> 
    	<input type="reset" value="Batal" name="Batal" class="btn btn-danger"></td>
  </tr>

  </table></font>
</form>
<?php }		
		if(isset($_POST['simpan'])){

		$kode=$_POST['kode'];
		$nmgejala=$_POST['nmgejala'];
		
		$sql="insert into gejala (kd_gejala,nm_gejala) values ('$kode','$nmgejala')";
		mysql_query($sql);

		echo'<script type="text/javascript">
			alert("Data Gejala Baru Disimpan");
			window.location="?data"
		</script>';
		
		}
?>


<?php
	if(isset($_GET['hapus'])){
		$id=$_GET['id'];
		unlink("../news/$nm");
		$sql="delete from gejala where kd_gejala='$id'";
		mysql_query($sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			window.location="?data"
			//]]>
		</script>';
	}
?>


<?php if(isset($_GET['edit'])){ 
$sql="select * from gejala where kd_gejala='$_GET[id]'";
$rs=mysql_query($sql);
$row=mysql_fetch_array($rs);
 { ?>
<form method="POST" action="">
<font face="arial" color="#8f5a1c">
  <table class="table" width="450" border="0" cellpadding="2" cellspacing="1" align="center">
  <tr class="success">
        <td colspan="2" class="center" >EDIT DATA KRITERIA</td>
      </tr>
  <tr>
    <td>Kode Kriteria</td>
    <td><input class="form-control" name="kd" type="text" maxlength="4" size="6" value="<?php echo $row['kd_gejala']; ?>" disabled="disabled">
    	<input name="id" type="hidden" value="<?php echo $row['kd_gejala']; ?>" >
    </td>
  </tr>
  <tr>
    <td width="90"> Kriteria</td>
    <td width="361">
    <input class="form-control" name="a" type="text" value="<?php echo $row['nm_gejala']; ?>" size="100" maxlength="100">
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="edit" value="Simpan" class="btn btn-success"> 
    	<input type="reset" name="reset" value="Batal" class="btn btn-danger"> 
    </td>
  </tr>
  </table></font>
</form>

<?php	} 
		
		if(isset($_POST['edit'])){

		$a=$_POST['a'];
		$id=$_POST[id];
		
		$sql="update gejala set nm_gejala='$a' where kd_gejala='$id'";
		mysql_query($sql);

		echo'<script type="text/javascript">
			alert("Data Kriteria Berhasil Edit");
			window.location="?data"
		</script>';
		
		}
?>

<?php } ?>
<?php include('bawah.php'); ?>
