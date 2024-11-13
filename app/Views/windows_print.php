<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laporan Pencetakan Barang Berdasarkan Tanggal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="header">
        <h2>Laporan Pencetakan Barang Berdasarkan Tanggal</h2>
        <div class="report-date">Tanggal Cetak: <?= date('d-m-Y') ?></div>
    </div>

    <table>
        <thead>
            <tr>
                <th>Nama Barang</th>
                <th>Username</th>
                <th>Harga Akhir</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($lelang)): ?>
                <?php foreach ($lelang as $item): ?>
                    <tr>
                        <td><?= $item->nama_barang ?></td>
                        <td><?= $item->username ?></td>
                        <td><?= $item->harga_akhir ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="7" style="text-align:center;">Data tidak ditemukan untuk tanggal yang dipilih.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

    <button onclick="window.print()">Print</button>

</body>
</html>
