<?php include('atas.php'); ?>
<?php if(isset($_GET['data'])){ ?>
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example">
	<thead>
		<tr>
			<th>No</th>
			<th>Jenis Kamar</th>
			<th>Opsi</th>
		</tr>
	</thead>
	<tbody>
<?php
	$sql="select * from artikel order by id desc";
	$rs=mysql_query($sql); $no=1;
	while($row=mysql_fetch_array($rs)){	 ?>
		<tr class="odd gradeX">
			<td class="center"><?php echo $no; ?></td>
			<td><?php echo $row['judul']; ?></td>
			<td class="center">
				<a title="Edit Data" href="?edit&id=<?php echo $row[0]; ?>&nm=<?php echo $row['foto']; ?>" class="btn btn-success"><i class="icon-edit icon-white"></i> </a> 
				<a title="Hapus Data" href="?hapus&id=<?php echo $row[0]; ?>&nm=<?php echo $row['foto']; ?>" onclick="return confirm('Yakin Mau Hapus..?');" class="btn btn-danger"><i class="icon-trash icon-white"></i> </a>
			</td>
		</tr>
<?php $no++; } ?>
	</tbody>
</table>
<?php } ?>


<?php if(isset($_GET['entri'])){  ?>

<form method="post" action="" enctype="multipart/form-data">
<table class="table table-hover">
	<tr class="success">
		<td colspan="2" >Entri Jenis Pelayanan</td>
	</tr>
	<tr>
		<td >Jenis Pelayanan</td>
		<td><input required type="text"  name="a" value=""  /></td>
	</tr>
	<tr>
		<td>Informasi Pelayanan</td>
		<td>
			<textarea name="isi" required> </textarea>
		</td>
	</tr>
	<tr>
		<td >Gambar </td>
		<td><input required type="file"  name="userfile" value=""  /></td>
	</tr>
	<tr>
		<td >Keyword </td>
		<td><input required type="text"  name="c" value=""  /></td>
	</tr>
	<tr>
		<td >Deskripsi </td>
		<td><input required type="text"  name="d" value=""  /></td>
	</tr>
	<tr>
		<td >Status </td>
		<td><select name="e" required>
			<option value="">--> Pilih <--</option>
			<option value="1">Aktif</option>
			<option value="0">Tidak Aktfi</option>
		</select></td>
	</tr>

	<tr>
		<td>&nbsp;</td>
		<td><input class="btn btn-success"  type="submit" name="save" value="SIMPAN DATA" />
		</td>
	</tr>
</table>
</form>

<?php	 if(isset($_POST['save'])){
		function bersih($a){
			$kata=mysql_escape_string($a);	
			return $kata;
		}
		$a=bersih($_POST['a']);
		$c=bersih($_POST['c']);
		$d=bersih($_POST['d']);
		$e=bersih($_POST['e']);
		$isi=bersih($_POST['isi']);
		$tgl=date('Y-m-d');
		$uploaddir = '../news/';
		$fileName = $_FILES['userfile']['name'];     
		$tmpName  = $_FILES['userfile']['tmp_name']; 
		$uploadfile = $uploaddir . $fileName;
		if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) 
		{
		$sql="insert into artikel values('','$_SESSION[SES_USER]','$tgl','$a'
		,'$isi','$fileName','$e','$c','$d')";
		mysql_query($sql);
		echo'<script type="text/javascript">
			alert("Berhasil Tambah Jenis Kamar");
			window.location="?data"
		</script>';
		}else
		echo'<script type="text/javascript">
			alert("Gagal Tambah Jenis Kamar");
		</script>';
}
?>

<?php } ?>

<?php if(isset($_GET['edit'])){ 
$sql="select * from artikel where id='$_GET[id]'";
$rs=mysql_query($sql);
$row=mysql_fetch_array($rs);
 { ?>
<form method="post" action="" enctype="multipart/form-data">
<table class="table table-hover">
	<tr class="info">
		<td colspan="2" >Edit Data Jenis Pelayanan</td>
	</tr>
	<tr>
		<td >Jenis Kamar</td>
		<td><input required type="text" class="span11" name="a" value="<?php echo $row['judul']; ?>"  /></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="isi" required><?php echo $row['isi']; ?></textarea>
		</td>
	</tr>
	<tr>
		<td >Foto</td>
		<td><input  type="file" class="span11" name="userfile" value=""  /></td>
	</tr>
	<tr>
		<td >Keyword Pisahkan Dengan Koma</td>
		<td><input required type="text" class="span11" name="c" value="<?php echo $row['keyword']; ?>"  /></td>
	</tr>
	<tr>
		<td >Deskripsi</td>
		<td><input required type="text" class="span11" name="d" value="<?php echo $row['deskripsi']; ?>"  /></td>
	</tr>
	<tr>
		<td >Status</td>
		<td><select name="e" required>
			<option value="1" <?php if($row['ket']==1) echo "selected"; ?>>Aktif</option>
			<option value="0" <?php if($row['ket']==2) echo "selected"; ?>>Tidak Aktfi</option>
		</select></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td><input class="btn btn-primary"  type="submit" name="edit" value="EDIT DATA" />
			<a href="?data" class="btn btn-danger" >BATAL</a>
		</td>
	</tr>
</table>
</form>
<?php	} if(isset($_POST['edit'])){
		function bersih($a){
			$kata=mysql_escape_string($a);	
			return $kata;
		}
		$a=bersih($_POST['a']);
		$c=bersih($_POST['c']);
		$d=bersih($_POST['d']);
		$e=bersih($_POST['e']);
		$isi=bersih($_POST['isi']);
		$tgl=date('Y-m-d');
		$uploaddir = '../news/';
		$fileName = $_FILES['userfile']['name'];     
		$tmpName  = $_FILES['userfile']['tmp_name']; 
		$uploadfile = $uploaddir . $fileName;
		if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) 
		{
		$sql="update artikel set idadmin='$_SESSION[SES_USER]',
		tgl='$tgl',judul='$a'
		,isi='$isi',foto='$userfile',ket='$e',keyword='$c',deskripsi='$d'
		where id='$_GET[id]'";
		mysql_query($sql);
		$nm=$_GET['nm'];
		unlink("../news/$nm");
		echo'<script type="text/javascript">
			alert("Berhasil Edit");
			window.location="?data"
		</script>';
		}else{
		$sql="update artikel set idadmin='$_SESSION[SES_USER]'
		,tgl='$tgl',judul='$a'
		,isi='$isi',ket='$e',keyword='$c',deskripsi='$d'
		where id='$_GET[id]'";
		mysql_query($sql);
		echo'<script type="text/javascript">
			alert("Berhasil Edit Artikel");
			window.location="?data"
		</script>';
		}
}
?>
<?php } ?>
<?php
	if(isset($_GET['hapus'])){
		$id=$_GET['id'];
		$nm=$_GET['nm'];
		unlink("../news/$nm");
		$sql="delete from artikel where id='$id'";
		mysql_query($sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			window.location="?data"
			//]]>
		</script>';
	}
?>
<?php include('bawah.php'); ?>
