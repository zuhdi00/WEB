<?php include "conf/inc.koneksi.php"; ?>
<div class="alert alert-info"><h4>Jenis-Jenis Kamar Di Hotel Sapta Nawa</h4></div>
      <div class="list-group">
        <?php $sql="select * from artikel order by id desc LIMIT 15";
        $rs=mysql_query($sql);
        while($row=mysql_fetch_array($rs)){ ?>
          <a href="?page=read&id=<?php echo $row[0]; ?>" class="list-group-item">
          <h4 class="list-group-item-heading"><?php echo $row['judul']; ?></h4>
          <img style="float:left;margin-right:20px;"src="news/<?php echo $row['foto']; ?>" class="image-rounded" width="170" height="120"/>
          <p class="list-group-item-text-justify">
          <?php echo substr($row['isi'],0,419); ?>
          </p>
          </a>
          <?php } ?>
      </div>