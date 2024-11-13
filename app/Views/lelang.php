<section class="section">
    <!-- Tombol Tambah Barang di bagian kiri -->
    <div class="text-start mt-4">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBarangModal">Tambah Barang</button>
    </div>

    <div class="row" id="barangPanelContainer">
        <?php if (!empty($oke)): ?>
            <?php foreach ($oke as $item): ?>
                <div class="col-md-4 mb-4">
                    <div class="card bg-light shadow-sm border-primary">
                    
                    <img src="<?= base_url( $item->foto_barang) ?>" alt="Gambar Barang" class="card-img-top" style="height: 150px; object-fit: cover;">
                    
                    <!-- Tombol Detail Foto -->
                    <button type="button" class="btn btn-secondary mt-2" data-bs-toggle="modal" data-bs-target="#fotoModal<?= $item->id_barang ?>">Detail Photo</button>

                        <div class="card-body text-center">
                            <h5 class="card-title"><?= htmlspecialchars($item->nama_barang) ?></h5>
                            <p class="card-text"><?= htmlspecialchars($item->deskripsi_barang) ?></p>
                            <p class="card-text"><strong>Harga Awal: Rp <?= number_format($item->harga, 0, ',', '.') ?></strong></p>
                            
                            <!-- Menampilkan informasi lelang -->
                            <p class="card-text"><strong>Status: </strong><?= $item->status ?></p>
                            <p class="card-text"><strong>Harga Akhir: </strong>Rp <?= number_format($item->harga_akhir, 0, ',', '.') ?></p>

                            <?php if ($item->status != "DITUTUP"): ?>
    <!-- Tombol Bet hanya muncul jika status tidak DITUTUP -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#betModal<?= $item->id_barang ?>">BET</button>
<?php else: ?>
    <button type="button" class="btn btn-secondary" disabled>Bet Ditutup</button>
<?php endif; ?>
<!-- Tombol Action Dropdown -->
<!-- Tombol Action Dropdown -->
<?php if (session()->get('level') == 'admin' || session()->get('level') == 'petugas'): ?>
    <div class="dropdown mt-2">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
            Action
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <!-- Edit Barang -->
            <li>
                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#editBarangModal" 
                   data-id="<?= $item->id_barang ?>"
                   data-nama="<?= $item->nama_barang ?>"
                   data-harga="<?= $item->harga ?>"
                   data-deskripsi="<?= $item->deskripsi_barang ?>"
                   data-foto="<?= $item->foto_barang ?>"
                >
                    Edit
                </a>
            </li>
            <!-- Delete Barang -->
            <li>
                <a class="dropdown-item" href="<?= base_url('home/hapus_barang/' . $item->id_barang) ?>">Delete</a>
            </li>

            <li>
                <a class="dropdown-item" href="<?= base_url('home/buka_lelang/' . $item->id_lelang) ?>">Buka Lelang</a>
            </li>
            <!-- Tutup Lelang -->
            <li>
                <a class="dropdown-item" href="<?= base_url('home/tutup_lelang/' . $item->id_lelang) ?>">Tutup Lelang</a>
            </li>
        </ul>
    </div>
<?php endif; ?>



                        </div>
                    </div>
                </div>


                <div class="modal fade" id="betModal<?= $item->id_barang ?>" tabindex="-1" aria-labelledby="betModalLabel<?= $item->id_barang ?>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="betModalLabel<?= $item->id_barang ?>">Masukkan Nominal Bet</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?= base_url('home/aksi_t_bet') ?>" method="POST">
                    <div class="mb-3">
                        <label for="nominalBet<?= $item->id_barang ?>" class="form-label">Nominal Bet (Rp)</label>
                        <input type="number" class="form-control" id="nominalBet<?= $item->id_barang ?>" name="nominal_bet" min="<?= $item->harga_akhir + 1 ?>" required>
                    </div>
                    <!-- Hidden fields for ID Barang and User -->
                    <input type="hidden" name="id_barang" value="<?= $item->id_barang ?>">
                    <input type="hidden" name="id_user" value="<?= session()->get('id') ?>"> <!-- ID User -->
                    <input type="hidden" name="tanggal_bet" value="<?= date('Y-m-d H:i:s'); ?>"> <!-- Tanggal Bet -->

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button type="submit" class="btn btn-primary">Kirim Bet</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
                

                <!-- Modal Foto Detail untuk setiap barang -->
                <div class="modal fade" id="fotoModal<?= $item->id_barang ?>" tabindex="-1" aria-labelledby="fotoModalLabel<?= $item->id_barang ?>" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="fotoModalLabel<?= $item->id_barang ?>">Detail Foto Barang</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body text-center">
                                <img src="<?= base_url($item->foto_barang) ?>" alt="Gambar Barang" class="img-fluid" style="max-height: 500px; object-fit: contain;">
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <p class="text-center">Tidak ada barang yang sedang dilelang.</p>
        <?php endif; ?>
    </div>
</section>

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
                <form action="<?= base_url('home/aksi_e_barang_lelang') ?>" method="POST" enctype="multipart/form-data">
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

<!-- Modal untuk Form Bet -->
<div class="modal fade" id="betModal<?= $item->id_barang ?>" tabindex="-1" aria-labelledby="betModalLabel<?= $item->id_barang ?>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="betModalLabel<?= $item->id_barang ?>">Masukkan Nominal Bet</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?= base_url('home/aksi_tambah_bet') ?>" method="POST">
                    <div class="mb-3">
                        <label for="nominalBet<?= $item->id_barang ?>" class="form-label">Nominal Bet (Rp)</label>
                        <input type="number" class="form-control" id="nominalBet<?= $item->id_barang ?>" name="nominal_bet" min="<?= $item->harga_akhir + 1 ?>" required>
                    </div>
                    <!-- Hidden fields for ID Barang and User -->
                    <input type="hidden" name="id_barang" value="<?= $item->id_barang ?>">
                    <input type="hidden" name="id_user" value="<?= session()->get('id') ?>"> <!-- ID User -->
                    <input type="hidden" name="tanggal_bet" value="<?= date('Y-m-d H:i:s'); ?>"> <!-- Tanggal Bet -->

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button type="submit" class="btn btn-primary">Kirim Bet</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>





<!-- Modal Foto Detail -->
<div class="modal fade" id="fotoModal<?= $item->id_barang ?>" tabindex="-1" aria-labelledby="fotoModalLabel<?= $item->id_barang ?>" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fotoModalLabel<?= $item->id_barang ?>">Detail Foto Barang</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <img src="<?= base_url($item->foto_barang) ?>" alt="Gambar Barang" class="img-fluid" style="max-height: 500px; object-fit: contain;">
            </div>
        </div>
    </div>
</div>



<!-- Modal for Adding Lelang -->
<div class="modal fade" id="addBarangModal" tabindex="-1" aria-labelledby="addBarangModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addBarangModalLabel">Tambah Lelang</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="<?= base_url('home/aksi_tambah_lelang') ?>" method="POST">
                <div class="modal-body">
                    <!-- Pilih Barang -->
                    <div class="col-md-7 mb-3">
                        <div class="form-group">
                            <label for="jenis_surat">Pilih Barang:</label>
                            <select class="form-control" name="jenis_surat" id="jenisSurat">
                                <option value="">Pilih Barang</option>
                                <?php foreach ($barang as $item): ?>
                                    <option value="<?= $item->id_barang ?>"
                                            data-image="<?= base_url('uploads/'.$item->foto_barang) ?>"
                                            data-name="<?= $item->nama_barang ?>"
                                            data-description="<?= $item->deskripsi_barang ?>"
                                            data-price="<?= $item->harga ?>">
                                        <?= $item->nama_barang ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>

                    <!-- Preview Barang yang dipilih -->
                    <div class="barang-preview mt-3" id="barangPreview" style="display: none;">
                        <div class="barang-card">
                            <img id="barangImage" src="" alt="Barang Image" class="barang-img" style="width: 100px; height: 100px; object-fit: cover;">
                            <h5 id="barangNama" class="barang-nama"></h5>
                            <p id="barangDeskripsi" class="barang-deskripsi"></p>
                            <p id="barangHarga" class="barang-harga"></p>
                        </div>
                    </div>
                    
                    <!-- Hidden fields for additional data -->
                    <input type="hidden" name="id_user" value="<?= session()->get('id'); ?>"> <!-- User ID -->
                    <input type="hidden" name="tanggal_lelang" value="<?= date('Y-m-d H:i:s'); ?>"> <!-- Current Date/Time -->
                    <input type="hidden" name="harga_akhir" id="hargaAkhir" value="0"> <!-- You can update this based on the auction -->
                    <input type="hidden" name="status" value="active"> <!-- Default status is active -->

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Tambah Lelang</button>
                </div>
            </form>
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
                        <input type="date" class="form-control" id="edit-tanggal" name="tanggal" required>
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
  document.addEventListener("DOMContentLoaded", function() {
    // When the user selects an item from the dropdown
    document.getElementById('jenisSurat').addEventListener('change', function() {
        var selectedOption = this.options[this.selectedIndex];

        // Get the data attributes from the selected option
        var imageUrl = selectedOption.getAttribute('data-image');
        var name = selectedOption.getAttribute('data-name');
        var description = selectedOption.getAttribute('data-description');
        var price = selectedOption.getAttribute('data-price');

        // If a valid option is selected
        if (imageUrl && name && description && price) {
            // Show the preview section
            document.getElementById('barangPreview').style.display = 'block';

            // Update the preview with the selected item's data
            document.getElementById('barangImage').src = imageUrl;
            document.getElementById('barangNama').textContent = name;
            document.getElementById('barangDeskripsi').textContent = description;
            document.getElementById('barangHarga').textContent = 'Harga: Rp ' + price;

            // Set the hidden field for harga_akhir to the selected price
            document.getElementById('hargaAkhir').value = price;
        } else {
            // Hide the preview section if no valid option is selected
            document.getElementById('barangPreview').style.display = 'none';
        }
    });
});


document.addEventListener("DOMContentLoaded", function() {
        const editButtons = document.querySelectorAll('.dropdown-item[data-bs-toggle="modal"]');
        
        editButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Ambil data dari atribut data-xxx
                const id = this.getAttribute('data-id');
                const nama = this.getAttribute('data-nama');
                const harga = this.getAttribute('data-harga');
                const deskripsi = this.getAttribute('data-deskripsi');
                const foto = this.getAttribute('data-foto');

                // Isi field dalam modal dengan data yang diambil
                document.getElementById('edit-id').value = id;
                document.getElementById('edit-nama_barang').value = nama;
                document.getElementById('edit-harga').value = harga;
                document.getElementById('edit-deskripsi_barang').value = deskripsi;
                document.getElementById('edit-foto').value = foto;

                // Tampilkan foto barang jika ada
                if (foto) {
                    document.getElementById('edit-foto').setAttribute('data-foto', foto);
                }
            });
        });
    });


</script>