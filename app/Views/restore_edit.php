<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-10">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title" style="text-transform: uppercase; font-size: 30px;">User</h4>
                </div>
                
                <!-- Add button with Modal trigger -->
                <a class="nav-link text-Headings my-2" href="#" data-bs-toggle="modal" data-bs-target="#addUser">
                    <span class="fa fa-plus-circle" style="font-size: 30px;"></span> Add User
                </a>

                <!-- Card Content with Table -->
                <div class="card-content">
                    <div class="card-body">
                        <!-- Table with outer spacing -->
                        <table class="table table-lg">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Nama User</th>
                                    <th>Level</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                                $no = 1;
                                foreach ($oke as $key) {
                            ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $key->username ?></td>
                                    <td><?= $key->level ?></td>
                                    <td>
                <a href="<?= base_url('home/aksi_restore_edit_user/' . $key->id_user) ?>">
                    <button class="btn btn-secondary">
                      <i class="now-ui-icons ui-1_check"></i> Restore
                    </button>
                  </a>
                  <a href="<?= base_url('home/hapus_user_permanent/' . $key->id_user  ) ?>">
                    <button class="btn btn-danger">
                      <i class="now-ui-icons ui-1_check"></i> Delete
                    </button>
                  </a>
            </td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
