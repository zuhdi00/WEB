<?php include('atas.php'); ?>
<?php if(isset($_GET['entri'])){ ?>
<form name="form1" method="post" >
<table class="table" >
<tr class="success">
	<td colspan="2" align="center">RULE KRITERIA DAN KARTU KREDIT</td>
</tr>
<tr>
	<td colspan="2"><b>Nama Kartu Kredit: </b></td>
</tr>
<tr>
	<td colspan="2">
	<select name="CmbSolusi" >
	<option value=0> Daftar Kartu Kredit </option>
	<?php
	$sqlp = "SELECT * FROM solusi ORDER BY kd_solusi";
	$qryp = mysql_query($sqlp, $koneksi)
		or die ("SQL Error: ".mysql_error());
	while ($datap=mysql_fetch_array($qryp)) {
	echo "<option value=$datap[kd_solusi]>$datap[nm_solusi]</option>";
	}
	?>
	</select>
	</td>	
</tr>
<tr>
	<td colspan="2">
	<b>Daftar Kriteria: </b></td>
	</tr>
<?php
$sql = "SELECT * FROM gejala ORDER BY kd_gejala";
$qry = mysql_query($sql, $koneksi)
	or die ("SQL Error: ".mysql_error());
	$no=0;
while ($data=mysql_fetch_array($qry)) {
	$no++;
	$sqlr = "SELECT * FROM rule ";
	$sqlr .= "WHERE kd_solusi='$data[kd_solusi]' ";
	$sqlr .= "AND kd_gejala='$data[kd_gejala]'";
	$qryr = mysql_query($sqlr, $koneksi);
	$cocok= mysql_num_rows($qryr);
	// Kode untuk nilai gejala terpilih dan
	// Kode untuk memberi warna pada nilai terpilih
	if ($cocok==1) {
		$cek = "checked";
		$bg = "#CCFF00";
	}
	else {
		$cek = "";
		$bg = "#FFFFFF";
	}
?>
<tr bgcolor="#FFFFFF">
	<td width="20" bgcolor="<?php echo $bg; ?>">
	<input name="CekGejala[]" type="checkbox" value="<?php echo $data['kd_gejala']; ?>" <?php echo $cek; ?>>
	</td>
	<td width="469">( <?php echo $data['kd_gejala']; ?> ) <?php echo $data['nm_gejala']; ?></td>
</tr>
<?php
	}
?>
<tr>
	<td colspan="2" align="center"><br>
	<input class="btn btn-success" type="submit" name="simpan" value="Simpan rule">
	<input class="btn btn-danger" type="reset" name="reset" value="Normalkan"></td>
</tr>
</table>
</form>

<?php 
if (isset($_POST['simpan'])) {

$TxtKodeH = $_REQUEST['TxtKodeH'];
$CekGejala = $_REQUEST['CekGejala'];

# Validasi Form
$TxtKodeH=$_POST['CmbSolusi'];
	$jum = count($CekGejala);
	if ($jum==0) {
		echo "BELUM ADA KRITERIA YANG DIPILIH";
	}
	else {
		# UNTUK MENGHAPUS YANG TIDAK DIPILIH LAGI
			// Kode untuk mendata rule
			$sqlpil = "SELECT * FROM rule WHERE kd_solusi='$TxtKodeH'";
			$qrypil = mysql_query($sqlpil);
			while ($datapil=mysql_fetch_array($qrypil)){
			// Kode untuk mengurai Gejala yang dipilih
				for ($i = 0; $i < $jum; ++$i) {
			// Perintah untuk menghapus rule
				if ($datapil['kd_gejala'] != $CekGejala[$i]) {
					$sqldel = "DELETE FROM rule ";
					$sqldel .= "WHERE kd_solusi='$TxtKodeH' ";
					$sqldel .= "AND NOT kd_gejala IN ('$CekGejala[$i]')";
					mysql_query($sqldel);
				}
			}
		}
		
		# UNTUK DATA GEJALA TAMBAHAN
		for ($i = 0; $i < $jum; ++$i) {
			// Perintah untuk mendapat rule
			$sqlr = "SELECT * FROM rule ";
			$sqlr .= "WHERE kd_solusi='$TxtKodeH' ";
			$sqlr .= "AND kd_gejala='$CekGejala[$i]'";
			$qryr = mysql_query($sqlr, $koneksi);
			$cocok = mysql_num_rows($qryr);
				// Gejala yang baru akan disimpan
			if (! $cocok==1) {
			
			$sql = "INSERT INTO rule (kd_solusi,kd_gejala) ";
			$sql .= "VALUES ('$TxtKodeH','$CekGejala[$i]')";
			mysql_query($sql, $koneksi)
				or die ("SQL Input rule Gagal".mysql_error());
			}
		}
			// Pesan sebagai konfirmasi
		echo'<script type="text/javascript">
			alert("Data Rule Baru Tersimpan");
			window.location="?data"
		</script>';
	
	}

}
 ?>

<?php }?>

<?php if(isset($_GET['data'])){ ?>
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example">
	<thead>
		<tr>
			<th>No</th>
			<th>Kode Solusi</th>
			<th>Kode Kriteria</th>
			<th>Opsi</th>
		</tr>
	</thead>
	<tbody>
<?php
	$sql="select * from rule order by kd_solusi";
	$rs=mysql_query($sql); $no=1;
	while($row=mysql_fetch_array($rs)){	 ?>
		<tr class="odd gradeX">
			<td class="center"><?php echo $no; ?></td>
			<td><?php echo $row['kd_solusi']; ?></td>
			<td><?php echo $row['kd_gejala']; ?></td>
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
		$sql="delete from rule where kd_solusi='$id'";
		mysql_query($sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			window.location="?data"
			//]]>
		</script>';
	}
?>
<?php include('bawah.php'); ?>