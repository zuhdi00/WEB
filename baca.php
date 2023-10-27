<?php include "conf/inc.koneksi.php";
?>

          <?php $sql="select * from artikel where id=$_GET[id]";
		$rs=mysql_query($sql);
		$row=mysql_fetch_array($rs);{ ?>
		<div class="panel panel-info">
		  <div class="panel-heading"><h4><?php echo $row['judul']; ?></h4></div>
		  <div class="panel-body">
		    <img style="float:left;margin-right:20px;"src="news/<?php echo $row['foto']; ?>" class="image-rounded" width="250" height="150"/>
		    <p><?php echo $row['isi']; ?></p>
		  </div>
		</div>
		<?php } ?>