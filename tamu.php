<?php include('atas.php'); ?>
<?php if(isset($_GET['data'])){ ?>
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example">
	<thead>
		<tr>
			<th>No</th>
			<th>Nama</th>
			<th>Email</th>
			<th>Isi</th>
			<th>Aksi</th>
		</tr>
	</thead>
	<tbody>
<?php
	$sql="select * from buku_tamu";
	$rs=mysql_query($sql); $no=1;
	while($row=mysql_fetch_array($rs)){	 ?>
		<tr class="odd gradeX">
			<td class="center"><?php echo $no; ?></td>
			<td><?php echo $row['nama']; ?></td>
			<td><?php echo $row['email']; ?></td>
			<td><?php echo $row['isi']; ?></td>
			<td class="center">
				<a title="Hapus Data" href="?hapus&id=<?php echo $row[0]; ?>" onclick="return confirm('Yakin Mau Hapus..?');" class="btn btn-danger"><i class="icon-trash icon-white"></i> </a>
			</td>
		</tr>
<?php $no++; } ?>
	</tbody>
</table>
<?php } ?>

<?php
	if(isset($_GET['hapus'])){
		$id=$_GET['id'];
		$sql="delete from buku_tamu where id='$id'";
		mysql_query($sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			window.location="?data"
			//]]>
		</script>';
	}
?>



<?php include('bawah.php'); ?>
