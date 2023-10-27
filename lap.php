<?php 
session_start();
include 'inc.koneksi.php'; 
include 'inc.session.php';
?>
<?php if(isset($_GET['gejala'])){ ?>
<body onload="window.print();" Layout="Portrait">
<center><h3>LAPORAN DATA KRITERIA</h3></center>
<table border=1 width=600>
<thead>
		<tr>
			<th>No</th>
			<th>Kode Kriteria</th>
			<th>Kriteria</th>
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
</tr>
	<?php
	}
	?>
</tbody>
</table>
</body>
<?php } ?>

<?php if(isset($_GET['solusi'])){ ?>
<body onload="window.print();" Layout="Portrait">
<center><h3>LAPORAN DATA KARTU KREDIT</h3></center>
<table border=1 width=700>
<thead>
		<tr>
			<th>No</th>
			<th>Kode Solusi</th>
			<th>Nama Kartu Kredit</th>
			<th>Gambar</th>
			<th>Bonus</th>
			<th>Manfaat Spesial</th>
			<th>Fitur Lain</th>
			<th>Biaya dan Bunga</th>
			<th>Syarat Pengajuan</th>
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
</tr>
	<?php
	}
	?>
</tbody>
</table>
</body>
<?php } ?>


<?php if(isset($_GET['diagnosa'])){ ?>
<body onload="window.print();" Layout="Landscape">
<center><h3>LAPORAN DATA KONSULTASI</h3></center>
<table border=1 width=1000>
<thead>
		<tr>
			<th>No</th>
			<th>Nama</th>
			<th>Jenis Kelamin</th>
			<th>Alamat</th>
			<th>Pekerjaan</th>
			<th>Tanggal Konsultasi</th>
			<th>Kartu Kredit</th>
		</tr>
	</thead>
<tbody>
<?php
	$sql = "SELECT analisa_hasil.nama,analisa_hasil.kelamin,analisa_hasil.alamat,analisa_hasil.pekerjaan,
	analisa_hasil.tanggal,solusi.nm_solusi	 FROM analisa_hasil,solusi 
	where analisa_hasil.kd_solusi=solusi.kd_solusi ORDER BY analisa_hasil.id desc";
	$qry = mysql_query($sql, $koneksi)
		or die ("SQL Error".mysql_error());
	$no=0;
	while ($data=mysql_fetch_array($qry)) {
	$no++;
?>
<tr class="odd gradeX">
	<td class="center"><?php echo $no; ?></td>
	<td><?php echo $data['nama']; ?></td>
	<td><?php 
		if ($data['kelamin']=="P") {
			echo "Laki-laki";
		}
		else {
			echo "Perempuan";
		}
	?></td>
	<td><?php echo $data['alamat']; ?></td>
	<td><?php echo $data['pekerjaan']; ?></td>
	<td><?php echo $data['tanggal']; ?></td>
	<td><?php echo $data['nm_solusi']; ?></td>
</tr>
	<?php
	}
	?>
</tbody>
</table>
</body>
<?php } ?>
