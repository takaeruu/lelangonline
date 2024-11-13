<section class="section">
    <div class="row" id="basic-table">
        <div class="col-12 col-md-10">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title" style="text-transform: uppercase; font-size: 30px;">Barang</h4>
                </div>
                
                <!-- Add button with Modal trigger -->
                <a class="nav-link text-Headings my-2" href="#" data-bs-toggle="modal" data-bs-target="#addBarangModal">
                    <span class="fa fa-plus-circle" style="font-size: 30px;"></span>
                </a>

                <!-- Card Content with Table -->
                <div class="card-content">
                    <div class="card-body">
                        <!-- Table with outer spacing -->
                        <table class="table table-lg">
                            <thead>
                                <tr>
                                    <th>NO</th>
                                    <th>Nama Barang</th>
                                    <th>Tanggal</th>
                                    <th>Harga</th>
                                    <th>Deskripsi Barang</th>
                                    <th>Foto Barang</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                    $no = 1;
                                    foreach ($oke as $key) {
                                        $fotoBarang = base_url($key->foto_barang); // Get full URL for the image
                                        $isFotoAvailable = !empty($key->foto_barang); // Check if the photo exists
                                ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $key->nama_barang ?></td>
                                    <td><?= $key->tanggal ?></td>
                                    <td><?= $key->harga ?></td>
                                    <td><?= $key->deskripsi_barang ?></td>
                                    <td>
                                        <?php if ($isFotoAvailable): ?>
                                            <!-- Add the "Lihat Foto" button -->
                                            <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#viewPhotoModal" data-img="<?= $fotoBarang ?>">
                                                Lihat Foto
                                            </button>
                                        <?php else: ?>
                                            <!-- Display "Tidak Ada Foto" if no photo is available -->
                                            <span class="text-muted">Tidak Ada Foto</span>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <!-- Dropdown Button -->
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                                Action
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <li>
                                                    <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#editBarangModal" 
                                                       data-id="<?= $key->id_barang ?>"
                                                       data-nama="<?= $key->nama_barang ?>"
                                                       data-harga="<?= $key->harga ?>"
                                                       data-deskripsi="<?= $key->deskripsi_barang ?>"
                                                       data-foto="<?= $fotoBarang ?>"
                                                    >
                                                        Edit
                                                    </a>
                                                </li>
                                                <li><a class="dropdown-item" href="<?= base_url('home/hapus_barang/' . $key->id_barang) ?>">Delete</a></li>
                                            </ul>
                                        </div>
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
</section>

<!-- Modal for Viewing Photo -->
<div class="modal fade" id="viewPhotoModal" tabindex="-1" aria-labelledby="viewPhotoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewPhotoModalLabel">Foto Barang</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- The image will be displayed here -->
                <img id="photoView" src="" alt="Foto Barang" class="img-fluid" />
            </div>
        </div>
    </div>
</div>

<!-- Modal for Adding Barang -->
<div class="modal fade" id="addBarangModal" tabindex="-1" aria-labelledby="addBarangModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBarangModalLabel">Tambah Barang</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Form to add Barang -->
                <form action="<?= base_url('home/aksi_t_barang') ?>" method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="nama_barang" class="form-label">Nama Barang</label>
                        <input type="text" class="form-control" id="nama_barang" name="nama_barang" required>
                    </div>
                    <div class="mb-3">
                        <label for="harga" class="form-label">Harga</label>
                        <input type="number" class="form-control" id="harga" name="harga" required>
                    </div>
                    <div class="mb-3">
                        <label for="deskripsi_barang" class="form-label">Deskripsi Barang</label>
                        <textarea class="form-control" id="deskripsi_barang" name="deskripsi_barang" rows="2" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="file" class="form-label">Foto</label>
                        <input type="file" class="form-control" id="file" name="file" required>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Tambah Barang</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Editing Barang -->
<div class="modal fade" id="editBarangModal" tabindex="-1" aria-labelledby="editBarangModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editBarangModalLabel">Edit Barang</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Form to Edit Barang -->
                <form action="<?= base_url('home/aksi_e_barang') ?>" method="POST" enctype="multipart/form-data">
                    <input type="hidden" id="edit-id" name="id_barang">


                    <div class="mb-3">
                        <label for="edit-tanggal" class="form-label">Tanggal</label>
                        <input type="date" class="form-control" id="edit-tanggal" name="tanggal" >
                    </div>
                    <div class="mb-3">
                        <label for="edit-nama_barang" class="form-label">Nama Barang</label>
                        <input type="text" class="form-control" id="edit-nama_barang" name="nama_barang" required>
                    </div>
                    <div class="mb-3">
                        <label for="edit-harga" class="form-label">Harga</label>
                        <input type="number" class="form-control" id="edit-harga" name="harga" required>
                    </div>
                    <div class="mb-3">
                        <label for="edit-deskripsi_barang" class="form-label">Deskripsi Barang</label>
                        <textarea class="form-control" id="edit-deskripsi_barang" name="deskripsi_barang" rows="2" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="edit-foto" class="form-label">Foto Barang</label>
                        <input type="file" class="form-control" id="edit-foto" name="file">
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Barang</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // This script handles both the "Lihat Foto" (View Photo) and "Edit Barang" (Edit Item) modals

    // For "Lihat Foto" Modal
    var viewPhotoModal = document.getElementById('viewPhotoModal');
    viewPhotoModal.addEventListener('show.bs.modal', function (event) {
        // Get the button that triggered the modal
        var button = event.relatedTarget; // Button that triggered the modal
        // Extract the image URL from the button's data attribute (data-img)
        var imgSrc = button.getAttribute('data-img');
        // Get the image element inside the modal
        var photoElement = document.getElementById('photoView');
        // Set the src attribute to the image URL (this will display the photo)
        photoElement.src = imgSrc;
    });

    // For "Edit Barang" Modal
    var editBarangModal = document.getElementById('editBarangModal');
    editBarangModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget; // The "Edit" button that triggered the modal
        var id = button.getAttribute('data-id'); // Get the item ID
        var tanggal = button.getAttribute('data-tanggal'); // Get the item date
        var nama = button.getAttribute('data-nama'); // Get the item name
        var harga = button.getAttribute('data-harga'); // Get the item price
        var deskripsi = button.getAttribute('data-deskripsi'); // Get the item description
        var foto = button.getAttribute('data-foto'); // Get the item photo (URL)

        // Populate the fields in the edit modal with the current values
        document.getElementById('edit-id').value = id;
        document.getElementById('edit-tanggal').value = tanggal;
        document.getElementById('edit-nama_barang').value = nama;
        document.getElementById('edit-harga').value = harga;
        document.getElementById('edit-deskripsi_barang').value = deskripsi;

        // If a photo exists, set it in the modal, otherwise, leave it blank
        if (foto) {
            document.getElementById('edit-foto').value = foto; // Set the photo URL in the file input field
        } else {
            document.getElementById('edit-foto').value = ''; // Leave empty if no photo exists
        }
    });
</script>

