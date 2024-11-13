<?php $currentUri = uri_string(); ?>

<body>
    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="logo">
                            <img src="<?= base_url('images/' . $yogi->logo_website) ?>" alt="logo" style="max-width: 150%; height: auto; max-height: 100px;"/>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>

                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <!-- Dashboard -->
                        <li class="sidebar-item <?= ($currentUri == 'home/dashboard') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/dashboard') ?>" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>DASHBOARD</span>
                            </a>
                        </li>

                        <?php
      if (session()->get('level') == 'admin' || session()->get('level') == 'petugas'){
        ?>
                        <!-- Menu -->
                        <li class="sidebar-item <?= ($currentUri == 'home/barang') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/barang') ?>" class='sidebar-link'>
                                <i class="fa fa-box"></i>
                                <span>BARANG</span>
                            </a>
                        </li>
                        <?php 
      } else {

      }
?>

<?php
      if (session()->get('level') == 'admin' || session()->get('level') == 'petugas' || session()->get('level') == 'masyarakat'){
        ?>

                        <li class="sidebar-item <?= ($currentUri == 'home/lelang') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/lelang') ?>" class='sidebar-link'>
                                <i class="fa fa-gavel"></i>
                                <span>LELANG</span>
                            </a>
                        </li>
                        <?php 
      } else {

      }
?>


<?php
      if (session()->get('level') == 'admin' || session()->get('level') == 'petugas'){
        ?>
                        <li class="sidebar-item <?= ($currentUri == 'home/laporan') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/laporan') ?>" class='sidebar-link'>
                                <i class="fa fa-gavel"></i>
                                <span>LAPORAN</span>
                            </a>
                        </li>
                        <?php 
      } else {

      }
?>


<?php
      if (session()->get('level') == 'admin'){
        ?>
                        
                        <li class="sidebar-item <?= ($currentUri == 'home/user') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/user') ?>" class='sidebar-link'>
                                <i class="fa fa-user"></i>
                                <span>USER</span>
                            </a>
                        </li>

                        <?php 
      } else {

      }
?>
                        <?php
      if (session()->get('level') == 'admin'){
        ?>
                        <li class="sidebar-item <?= ($currentUri == 'home/setting') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/setting') ?>" class='sidebar-link'>
                                <i class="bi bi-file-earmark-medical-fill"></i>
                                <span>SETTINGS</span>
                            </a>
                        </li>

                        <!-- Soft Delete -->
                        <li class="sidebar-item <?= ($currentUri == 'home/soft_delete') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/soft_delete') ?>" class='sidebar-link'>
                                <i class="bi bi-file-earmark-medical-fill"></i>
                                <span>SOFT DELETE</span>
                            </a>
                        </li>

                        <!-- Restore Edit -->
                        <li class="sidebar-item <?= ($currentUri == 'home/restore_edit_user') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/restore_edit_user') ?>" class='sidebar-link'>
                                <i class="bi bi-file-earmark-medical-fill"></i>
                                <span>RESTORE EDIT</span>
                            </a>
                        </li>

                        <!-- Log Activity -->
                        <li class="sidebar-item <?= ($currentUri == 'home/log_activity') ? 'active' : '' ?>">
                            <a href="<?= base_url('home/log_activity') ?>" class='sidebar-link'>
                                <i class="bi bi-file-earmark-medical-fill"></i>
                                <span>LOG ACTIVITY</span>
                            </a>
                        </li>

                        <?php 
      } else {

      }
?>

                        <li class="sidebar-item">
    <a href="<?= base_url('home/logout') ?>" class="sidebar-link">
        <i class="fa fa-sign-out-alt"></i>
        <span>Logout</span>
    </a>
</li>

                    </ul>
                </div>
            </div>
        </div>
        <div id="main">
            <header class="mb-3"></header>
