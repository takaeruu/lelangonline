<form action="" method="GET">
    <div class="card-body">
        <div class="row">
            <!-- Tanggal Awal -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="tanggal_awal">Tanggal Awal</label>
                    <input type="date" class="form-control" name="tanggal_awal" id="tanggal_awal" required>
                </div>
            </div>

            <!-- Tanggal Akhir -->
            <div class="col-md-6">
                <div class="form-group">
                    <label for="tanggal_akhir">Tanggal Akhir</label>
                    <input type="date" class="form-control" name="tanggal_akhir" id="tanggal_akhir" required>
                </div>
            </div>
        </div>
    </div>

    <div class="card-footer text-end">
    <button type="submit" formaction="<?= base_url('home/windows_print') ?>" class="btn btn-secondary me-2">PRINT</button>
    </div>
</form>
