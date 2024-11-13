<?php

namespace App\Models;

use CodeIgniter\Model;

class M_lelang extends Model
{



    public function tambah($table, $isi)
    {
        return $this->db->table($table)
            ->insert($isi);
    }
public function tampil($yoga)
    {
        return $this->db->table($yoga)
            ->get()
            ->getResult();
    }
    public function hapus($table, $where)
    {
        return $this->db->table($table)
            ->delete($where);
    }

    public function edit($tabel, $isi, $where)
    {
        return $this->db->table($tabel)
            ->update($isi, $where);
    }
    public function saveToBackup($table, $data)
    {
        return $this->db->table($table)->insert($data);
    }
    

public function getWhere1($table, $where)
    {
        return $this->db->table($table)->where($where)->get();
    }
    public function getWhere($tabel,$where){
        return $this->db->table($tabel)
                        ->getwhere($where)
                        ->getRow();
    }

    public function logActivity($data)
{
    return $this->db->table('user_activity')->insert($data);
}

public function join2($tabel1, $tabel2, $on)
{
    // Lakukan join dan ambil hasilnya sebagai array objek
    return $this->db->table($tabel1)
                    ->join($tabel2, $on, 'left')
                    ->get()
                    ->getResult(); // Mengembalikan hasil sebagai array objek
}
public function join3($tanggal_awal, $tanggal_akhir)
{
    // Query untuk menggabungkan tiga tabel dan filter berdasarkan tanggal_lelang
    return $this->db->table('tb_lelang')
                    ->select('tb_lelang.id_lelang, tb_lelang.id_barang, tb_lelang.id_user, tb_lelang.tanggal_lelang, tb_lelang.harga_akhir, tb_lelang.status, tb_barang.nama_barang, tb_user.username')  // Select needed columns, including nama_barang
                    ->join('tb_barang', 'tb_lelang.id_barang = tb_barang.id_barang', 'left')  // Join tabel lelang dengan barang
                    ->join('tb_user', 'tb_lelang.id_user = tb_user.id_user', 'left')          // Join tabel lelang dengan user
                    ->where('tb_lelang.tanggal_lelang >=', $tanggal_awal)  // Filter berdasarkan tanggal_awal
                    ->where('tb_lelang.tanggal_lelang <=', $tanggal_akhir) // Filter berdasarkan tanggal_akhir
                    ->get()  // Jalankan query
                    ->getResult();  // Mengembalikan hasil sebagai objek array
}


protected $table = 'tb_barang';  // Set the correct table name
protected $primaryKey = 'id_barang'; // Optional, but useful if you have a specific primary key
protected $allowedFields = ['tanggal', 'nama_barang', 'harga', 'deskripsi_barang', 'foto_barang']; // List the fields you want to allow for insert/update
public function getDataById($id)
{
    // Return a single row based on the 'id_barang'
    return $this->where('id_barang', $id)->first();  // .first() will return the first result or null if no row matches
}

public function getAllUsers()
{
    // Fetch all users for the dropdown filter
    return $this->db->table('tb_user')->select('id_user, username')->get()->getResultArray();
}

public function getLogsByUser($userId)
{
    $builder = $this->db->table('user_activity');
    $builder->join('tb_user', 'tb_user.id_user = user_activity.id_user');  // Use 'tb_user' here
    $builder->select('user_activity.*, tb_user.username');  // Use 'tb_user' here
    $builder->where('user_activity.id_user', $userId);  // Filter by user ID
    $builder->orderBy('time', 'DESC');
    
    $query = $builder->get();

    if ($query === false) {
        $error = $this->db->error();
        log_message('error', 'Query error: ' . $error['message']);
        return [];
    }

    return $query->getResultArray();
}


public function getLogs()
{
    $builder = $this->db->table('user_activity');  // Ensure the correct table name here
    $builder->join('tb_user', 'tb_user.id_user = user_activity.id_user');  // Use 'tb_user' here
    $builder->select('user_activity.*, tb_user.username');  // Use 'tb_user' here
    $builder->orderBy('time', 'DESC');
    
    $query = $builder->get();

    if ($query === false) {
        // Log the error for debugging
        $error = $this->db->error();
        log_message('error', 'Query error: ' . $error['message']);
        return [];
    }

    return $query->getResultArray();
}


public function carilelang($tgl_awal, $tgl_selesai)
    {
        $query = "SELECT tb_barang.nama_barang,
       tb_user.username, 
       tb_lelang.harga_akhir
FROM tb_lelang
JOIN tb_barang ON tb_lelang.id_barang = tb_barang.id_barang
JOIN tb_user ON tb_lelang.id_user = tb_user.id_user
WHERE tb_lelang.tanggal_lelang BETWEEN ? AND ?;
";

        return $this->db->query($query, [$tgl_awal, $tgl_selesai])->getResult();
    }


public function tampilrestore($yoga)
    {
        return $this->db->table($yoga)
            ->where('deleted_at IS NOT NULL') // Menambahkan kondisi deleted_at IS NOT NULL
            ->get()
            ->getResult();
    }

    public function tampilActive($tableName)
{
    return $this->db->table($tableName)
        ->where('deleted_at', null) // Filtering records where deleted_at is null
        ->get()
        ->getResult();
}



}