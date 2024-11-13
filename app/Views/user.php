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
                                foreach ($user as $key) {
                            ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $key->username ?></td>
                                    <td><?= $key->level ?></td>
                                    <td>
                                        <!-- Edit Button with Modal Trigger -->
                                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editUser" data-id="<?= $key->id_user ?>" data-username="<?= $key->username ?>" data-level="<?= $key->level ?>">Edit</button>
                                        <!-- Delete Button -->
                                        <a href="<?= base_url('home/hapus_user/'.$key->id_user) ?>">
                                            <button class="btn btn-danger">Delete</button>
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

    <!-- Modal for adding user -->
    <div class="modal fade" id="addUser" tabindex="-1" aria-labelledby="addUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserLabel">Tambah User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="<?= base_url('home/aksi_t_user') ?>" method="POST">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="username" class="form-label">Nama User</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="level" class="form-label">Level</label>
                            <select class="form-select" id="level" name="level" required>
                                <option value="admin">Admin</option>
                                <option value="petugas">Petugas</option>
                                <option value="masyarakat">Masyarakat</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal for editing user -->
    <div class="modal fade" id="editUser" tabindex="-1" aria-labelledby="editUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserLabel">Edit User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="<?= base_url('home/aksi_e_user') ?>" method="POST">
                    <div class="modal-body">
                        <input type="hidden" id="edit_id_user" name="id_user">
                        
                        <!-- Username Field -->
                        <div class="mb-3">
                            <label for="edit_username" class="form-label">Nama User</label>
                            <input type="text" class="form-control" id="edit_username" name="username" required>
                        </div>

                        <!-- Level Field -->
                        <div class="mb-3">
                            <label for="edit_level" class="form-label">Level</label>
                            <select class="form-select" id="edit_level" name="level" required>
                                <option value="admin">Admin</option>
                                <option value="petugas">Petugas</option>
                                <option value="masyarakat">Masyarakat</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</section>

<script>
    // Handle passing user data to the edit modal
    var editUserModal = document.getElementById('editUser')
    editUserModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget; // Button that triggered the modal
        var idUser = button.getAttribute('data-id');
        var username = button.getAttribute('data-username');
        var level = button.getAttribute('data-level');

        // Fill the modal form with data
        var modal = editUserModal.querySelector('form');
        modal.querySelector('#edit_id_user').value = idUser;
        modal.querySelector('#edit_username').value = username;
        modal.querySelector('#edit_level').value = level;
    });
</script>
