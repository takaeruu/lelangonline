<?php

namespace App\Controllers;
use App\Models\M_lelang;
class Home extends BaseController
{
	public function dashboard()
{
	$model= new M_lelang();
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();

    // Ambil nama pengguna dari session
    $session = session();
    $data['username'] = $session->get('username');


    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Dashboard',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    echo view('header', $data);
    echo view('menu');
    echo view('dashboard', $data);
    echo view('footer');
}


public function login()
	{
		$model= new M_lelang();
		$where = array('id_setting' => '1');
		$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Login',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
	echo view('header', $data);
	echo view('login');
	}

    public function logout()

    {
        session()->destroy();
        return redirect()->to('home/login');
    }



public function aksi_login()
{
    // Periksa koneksi internet
    if (!$this->checkInternetConnection()) {
        // Jika tidak ada koneksi, cek CAPTCHA gambar
        $captcha_code = $this->request->getPost('captcha_code');
        if (session()->get('captcha_code') !== $captcha_code) {
            session()->setFlashdata('toast_message', 'Invalid CAPTCHA');
            session()->setFlashdata('toast_type', 'danger');
            return redirect()->to('home/login');
        }
    } else {
        // Jika ada koneksi, cek Google reCAPTCHA
        $recaptchaResponse = trim($this->request->getPost('g-recaptcha-response'));
        $secret = '6LflU30qAAAAAJy5_UytmlLGPV--NlaIgTsgE5Kb'; // Ganti dengan Secret Key Anda
        $credential = array(
            'secret' => $secret,
            'response' => $recaptchaResponse
        );

        $verify = curl_init();
        curl_setopt($verify, CURLOPT_URL, "https://www.google.com/recaptcha/api/siteverify");
        curl_setopt($verify, CURLOPT_POST, true);
        curl_setopt($verify, CURLOPT_POSTFIELDS, http_build_query($credential));
        curl_setopt($verify, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($verify, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($verify);
        curl_close($verify);

        $level = json_decode($response, true);

        if (!$level['success']) {
            session()->setFlashdata('toast_message', 'Captcha validation failed');
            session()->setFlashdata('toast_type', 'danger');
            return redirect()->to('home/login');
        }
    }

    // Proses login seperti biasa
    $u = $this->request->getPost('username');
    $p = $this->request->getPost('password');

    $where = array(
        'username' => $u,
        'password' => md5($p),
    );
    $model = new M_lelang;
    $cek = $model->getWhere('tb_user', $where);

    if ($cek) {
        session()->set('nama', $cek->username);
        session()->set('id', $cek->id_user);
        session()->set('level', $cek->level);
        return redirect()->to('home/dashboard');
    } else {
        session()->setFlashdata('toast_message', 'Invalid login credentials');
        session()->setFlashdata('toast_type', 'danger');
        return redirect()->to('home/login');
    }
}



public function generateCaptcha()
{
    // Create a string of possible characters
    $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    $captcha_code = '';
    
    // Generate a random CAPTCHA code with letters and numbers
    for ($i = 0; $i < 6; $i++) {
        $captcha_code .= $characters[rand(0, strlen($characters) - 1)];
    }
    
    // Store CAPTCHA code in session
    session()->set('captcha_code', $captcha_code);
    
    // Create an image for CAPTCHA
    $image = imagecreate(120, 40); // Increased size for better readability
    $background = imagecolorallocate($image, 200, 200, 200);
    $text_color = imagecolorallocate($image, 0, 0, 0);
    $line_color = imagecolorallocate($image, 64, 64, 64);
    
    imagefilledrectangle($image, 0, 0, 120, 40, $background);
    
    // Add some random lines to the CAPTCHA image for added complexity
    for ($i = 0; $i < 5; $i++) {
        imageline($image, rand(0, 120), rand(0, 40), rand(0, 120), rand(0, 40), $line_color);
    }
    
    // Add the CAPTCHA code to the image
    imagestring($image, 5, 20, 10, $captcha_code, $text_color);
    
    // Output the CAPTCHA image
    header('Content-type: image/png');
    imagepng($image);
    imagedestroy($image);
}




public function checkInternetConnection()
{
    $connected = @fsockopen("www.google.com", 80);
    if ($connected) {
        fclose($connected);
        return true;
    } else {
        return false;
    }
}


public function register()
	{
		$model= new M_lelang();
		$where = array('id_setting' => '1');
		$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Register',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
	echo view('header', $data);
	echo view('register');
	}


	public function aksi_t_register()
{
    if(session()->get('id') > 0) {
        $username = $this->request->getPost('username');
        $password = $this->request->getPost('password');
        
        // Hash the password using MD5
        $hashedPassword = md5($password);

        $darren = array(
            'username' => $username,
            'password' => $hashedPassword, 
			'level' => 'masyarakat',  // Store the hashed password
        );

        // Initialize the model
        $model = new M_lelang;
        $model->tambah('tb_user', $darren);

        // Redirect to the 'tb_user' page
        return redirect()->to('home/login');
    } else {
        // If no session or user is logged in, redirect to the login page
        return redirect()->to('home/login');
    }
}

public function barang()
	{
		$model= new M_lelang();
		$where = array('id_setting' => '1');
		$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $id_user = session()->get('id');
		$data['oke'] = $model->tampil('tb_barang');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Barang',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
	echo view('header', $data);
	echo view('menu');
	echo view('barang', $data);
	echo view('footer');
	}


	public function aksi_t_barang()
{
    if (session()->get('id') > 0) {
        $nama_barang = $this->request->getPost('nama_barang');
        $harga = $this->request->getPost('harga');
        $deskripsi = $this->request->getPost('deskripsi_barang');

        // Handle file upload
        $file = $this->request->getFile('file');
        
        if ($file->isValid() && !$file->hasMoved()) {
            // Get the file extension
            $extension = $file->getExtension();

            // Generate a new file name to avoid overwriting
            $newFileName = $file->getRandomName();
            
            // Move the file to the 'uploads' folder
			$file->move(ROOTPATH . 'public/uploads', $newFileName);

            // Store the file path and its extension (for file type identification)
            $filePath = 'uploads/' . $newFileName;
        } else {
            // If file is not valid, handle this scenario (maybe you can set a default image or return an error)
            $filePath = null;
        }

        // Prepare data for insertion into the database
        $darren = array(
            'nama_barang' => $nama_barang,
            'harga' => $harga,
            'deskripsi_barang' => $deskripsi,
            'foto_barang' => $filePath,  // Store the file path in the database
            'tanggal' => date('Y-m-d'),
        );

        // Initialize the model and insert the data
        $model = new M_lelang();
        $model->tambah('tb_barang', $darren);

        // Redirect to the 'barang' page after successful insertion
        return redirect()->to('home/barang');
    } else {
        // If no session or user is logged in, redirect to the login page
        return redirect()->to('home/login');
    }
}


public function aksi_e_barang()
{
    if (session()->get('id') > 0) {
        // Get the form data
        $tanggal = $this->request->getPost('tanggal');
        $nama_barang = $this->request->getPost('nama_barang');
        $harga = $this->request->getPost('harga');
        $deskripsi = $this->request->getPost('deskripsi_barang');
        $id = $this->request->getPost('id_barang');

        $where = array('id_barang' => $id);

        // Get current data (including foto_barang) before updating
        $model = new M_lelang();
        $currentData = $model->getDataById($id);  // Assume this method exists and returns the current row

        // Set the filePath to the current foto_barang if no new file is uploaded
        $filePath = $currentData['foto_barang'];

        // Handle file upload (check if file is provided)
        $file = $this->request->getFile('file');
        if ($file && $file->isValid() && !$file->hasMoved()) {
            // Get the file extension
            $extension = $file->getExtension();

            // Generate a new file name to avoid overwriting
            $newFileName = $file->getRandomName();
            
            // Move the file to the 'uploads' folder
            $file->move(ROOTPATH . 'public/uploads', $newFileName);

            // Store the new file path
            $filePath = 'uploads/' . $newFileName;
        }

        // Prepare data for updating the database
        $isi = array(
            'tanggal' => $tanggal,
            'nama_barang' => $nama_barang,
            'harga' => $harga,
            'deskripsi_barang' => $deskripsi,
            'foto_barang' => $filePath,  // Use the file path (either new or current)
        );

        // Update the record in the database
        $model->edit('tb_barang', $isi, $where);

        // Redirect to the barang page after successful update
        return redirect()->to('home/barang');
    } else {
        // If no session or user is logged in, redirect to the login page
        return redirect()->to('home/login');
    }
}


public function hapus_barang($id)
{
    $model = new M_lelang();
    // $this->logUserActivity('Menghapus Pemesanan Permanent');
    $where = array('id_barang' => $id);
    $model->hapus('tb_barang', $where);
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Menghapus Barang',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    return redirect()->to('Home/barang');
}

public function lelang() {
    $model = new M_lelang();
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    
    $id_user = session()->get('id');
    
    // Mengambil data barang lelang dan barang terkait
    $data['oke'] = $model->join2('tb_lelang', 'tb_barang', 'tb_lelang.id_barang=tb_barang.id_barang');
    $data['barang'] = $model->tampil('tb_barang');

    // Logging aktivitas
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Lelang',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);

    // Menampilkan views
    echo view('header', $data);
    echo view('menu');
    echo view('lelang', $data);
    echo view('footer');
}


	public function aksi_tambah_lelang()
{
    if (session()->get('id') > 0) {
        // Get the form data
        $jenis_surat = $this->request->getPost('jenis_surat');
        $id_user = $this->request->getPost('id_user');
        $tanggal_lelang = $this->request->getPost('tanggal_lelang');
        $harga_akhir = $this->request->getPost('harga_akhir');
        $status = $this->request->getPost('status');

        // Check if barang is selected
        if ($jenis_surat) {
            // Insert data into tb_lelang
            $model = new M_lelang();

            // Prepare data for insertion
            $data = [
                'id_barang' => $jenis_surat,
                'id_user' => $id_user,
                'tanggal_lelang' => $tanggal_lelang,
                'harga_akhir' => $harga_akhir,
                'status' => 'DIBUKA'
            ];

            // Insert the data into tb_lelang
            $model->tambah('tb_lelang', $data);

            // Redirect with success message
            return redirect()->to('home/lelang')->with('success', 'Lelang berhasil ditambahkan.');
        } else {
            // If no item was selected
            return redirect()->back()->with('error', 'Pilih barang terlebih dahulu.');
        }
    } else {
        return redirect()->to('home/login');
    }
}

public function tutup_lelang($id)
    {
        $model = new M_lelang();
        $where = array('id_lelang' => $id);
        $array = array(
            'status' =>'DITUTUP',
        );
        $model->edit('tb_lelang', $array, $where);
        // $this->logUserActivity('Menghapus Pemesanan');

        return redirect()->to('home/lelang');
    }

    public function buka_lelang($id)
    {
        $model = new M_lelang();
        $where = array('id_lelang' => $id);
        $array = array(
            'status' =>'DIBUKA',
        );
        $model->edit('tb_lelang', $array, $where);
        // $this->logUserActivity('Menghapus Pemesanan');

        return redirect()->to('home/lelang');
    }


public function aksi_t_bet()
{
    // Menggunakan model M_lelang
    $model = new M_lelang();

    // Ambil data dari POST
    $id_barang = $this->request->getPost('id_barang');
    $nominal_bet = $this->request->getPost('nominal_bet');
    $id_user = $this->request->getPost('id_user');
    $tanggal_bet = $this->request->getPost('tanggal_bet');

    // 1. Update harga_akhir di tb_lelang dengan pengecekan berdasarkan id_user
    // Misalnya, hanya membolehkan update jika id_user sesuai dengan session user
    $model->edit('tb_lelang', 
        ['harga_akhir' => $nominal_bet],  // Mengubah harga_akhir sesuai nominal bet
        ['id_barang' => $id_barang, 'id_user' => session()->get('id')]  // Kondisi update berdasarkan id_barang dan id_user
    );

    // 2. Insert ke tb_history_lelang menggunakan fungsi tambah
    $data_history = [
        'id_user' => session()->get('id'),  // ID User yang sedang login
        'id_lelang' => $id_barang,          // Menyimpan id_barang sebagai id_lelang
        'id_barang' => $id_barang,
        'penawaran_harga' => $nominal_bet,
        'tanggal' => $tanggal_bet,          // Tanggal bet
    ];

    // Memasukkan data penawaran ke history lelang
    $model->tambah('tb_history_lelang', $data_history);

    // Redirect ke halaman lelang setelah berhasil
    return redirect()->to('home/lelang');  // Redirect ke halaman lelang atau sesuai kebutuhan
}

public function aksi_e_barang_lelang()
{
    if (session()->get('id') > 0) {
        // Get the form data
        $tanggal = $this->request->getPost('tanggal');
        $nama_barang = $this->request->getPost('nama_barang');
        $harga = $this->request->getPost('harga');
        $deskripsi = $this->request->getPost('deskripsi_barang');
        $id = $this->request->getPost('id_barang');

        $where = array('id_barang' => $id);

        // Get current data (including foto_barang) before updating
        $model = new M_lelang();
        $currentData = $model->getDataById($id);  // Assume this method exists and returns the current row

        // Set the filePath to the current foto_barang if no new file is uploaded
        $filePath = $currentData['foto_barang'];

        // Handle file upload (check if file is provided)
        $file = $this->request->getFile('file');
        if ($file && $file->isValid() && !$file->hasMoved()) {
            // Get the file extension
            $extension = $file->getExtension();

            // Generate a new file name to avoid overwriting
            $newFileName = $file->getRandomName();
            
            // Move the file to the 'uploads' folder
            $file->move(ROOTPATH . 'public/uploads', $newFileName);

            // Store the new file path
            $filePath = 'uploads/' . $newFileName;
        }

        // Prepare data for updating the database
        $isi = array(
            'tanggal' => $tanggal,
            'nama_barang' => $nama_barang,
            'harga' => $harga,
            'deskripsi_barang' => $deskripsi,
            'foto_barang' => $filePath,  // Use the file path (either new or current)
        );

        // Update the record in the database
        $model->edit('tb_barang', $isi, $where);

        // Redirect to the barang page after successful update
        return redirect()->to('home/lelang');
    } else {
        // If no session or user is logged in, redirect to the login page
        return redirect()->to('home/login');
    }
}

public function user() {
    $model = new M_lelang();
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    
    $id_user = session()->get('id');
    
    // Mengambil data barang lelang dan barang terkait
    $data['user'] = $model->tampilactive('tb_user');

    // Logging aktivitas
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke User',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);

    // Menampilkan views
    echo view('header', $data);
    echo view('menu');
    echo view('user', $data);
    echo view('footer');
}

public function aksi_t_user()
{
    if(session()->get('id') > 0){
        $username = $this->request->getPost('username');
        $level = $this->request->getPost('level');


        $darren = array(
            'username' => $username,
            'level' => $level,
        );

        $model = new M_lelang;
        $model->tambah('tb_user', $darren); // Menyimpan data user ke database
        return redirect()->to('home/user');
    } else {
        return redirect()->to('home/login');
    }
}


public function aksi_e_user1()
{
    if(session()->get('id') > 0){
        $username = $this->request->getPost('username');
        $level = $this->request->getPost('level');
        $id = $this->request->getPost('id_user');

        $where = array('id_user' => $id);

        $isi = array(
            'username' => $username,
            'level' => $level,
        );

        $model = new M_lelang;
        $model->edit('tb_user', $isi, $where);
        return redirect()->to('home/user');
    } else {
        return redirect()->to('home/login');
    }
}


// public function aksi_e_user()
// 	{
// 		$username = $this->request->getPost('username');
//         $level = $this->request->getPost('level');
//         $id = $this->request->getPost('id_user');


//         $model = new M_lelang(); 

// 		$oldData = $model->getWhere1('tb_user', ['id_user' => $id])->getRow();

//     if ($oldData) {
//         // Backup data lama
//         $backupData = [
//             'id_user' => $oldData->id_user,
//             'username' => $oldData->username,
//             'level' => $oldData->level,
//             'backup_at' => date('Y-m-d H:i:s'),
//             'backup_by' => session()->get('id'), // ID pengguna yang membuat backup
//         ];
		
//         if ($model->saveToBackup('tb_user_backup', $backupData)) {
//             // Update data kelas
//             $oke = [
//                 'username' => $username,
//                 'level' => $level,
//                 'updated_by' => session()->get('id'),
//                 'updated_at' => date('Y-m-d H:i:s'),
//             ];

//             $where = array('id_user'=>$id);
//             $model->edit('tb_user', $oke, $where);

// 		return redirect()->to('home/user');

// 	    }
//     }
// }


public function aksi_e_user()
    {
        $username = $this->request->getPost('username');
        $level = $this->request->getPost('level');
        $id = $this->request->getPost('id_user');

        $model = new M_lelang;

        // Ambil data lama sebelum update
        $oldData = $model->getWhere('tb_user', ['id_user' => $id]);

        // Simpan data lama ke tabel backup
        if ($oldData) {
            $backupData = [
                'id_user' => $oldData->id_user,  // integer
                'username' => $oldData->username,             // integer
                'level' => $oldData->level,     // integer
                'backup_by' => $oldData->backup_by,         // integer
                'backup_at' => $oldData->backup_at,         // datetime
            ];

            // Debug: cek hasil insert ke tabel backup
            if ($model->saveToBackup('tb_user_backup', $backupData)) {
                echo "Data backup berhasil disimpan!";
            } else {
                echo "Gagal menyimpan data ke backup.";
            }
        } else {
            echo "Data lama tidak ditemukan.";
        }

        // Data baru yang akan diupdate
        $darren = array(
           'username' => $username,
                'level' => $level,
                'updated_by' => session()->get('id'),
                'updated_at' => date('Y-m-d H:i:s'),
        );

        // Update data di tabel pemesanan
        $where = array('id_user' => $id);
        $model->edit('tb_user', $darren, $where);

        return redirect()->to('home/user');
    }
public function soft_delete(){

    $model = new M_lelang;
    $data['oke'] = $model->tampilrestore('tb_user');
    $where = array('id_setting' => '1');
    $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Soft Delete',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
    echo view('header', $data);
    echo view('menu');
    echo view('soft_delete', $data);
    echo view('footer');
}

public function hapus_user($id)
    {
        $model = new M_lelang();
        $where = array('id_user' => $id);
        $array = array(
            'deleted_at' => date('Y-m-d H:i:s'),
        );
        $model->edit('tb_user', $array, $where);
        // $this->logUserActivity('Menghapus Pemesanan');

        return redirect()->to('home/user');
    }

    public function restore_user($id)
    {
        $model = new M_lelang();
        $where = array('id_user' => $id);
        $array = array(
            'deleted_at' => NULL, // Mengatur deleted_at menjadi null
        );
        $model->edit('tb_user', $array, $where);
    
        return redirect()->to('home/user');
    }

    public function hapus_user_permanent($id)
    {
        $model = new M_lelang();
        // $this->logUserActivity('Menghapus Pemesanan Permanent');
        $where = array('id_user' => $id);
        $model->hapus('tb_user', $where);
    
        return redirect()->to('Home/user');
    }


    public function restore_edit_user(){

        $model = new M_lelang;
        $data['oke'] = $model->tampil('tb_user_backup');
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $id_user = session()->get('id');
        $activityLog = [
            'id_user' => $id_user,
            'menu' => 'Masuk ke Restore Edit User',
            'time' => date('Y-m-d H:i:s')
        ];
        $model->logActivity($activityLog);
        echo view('header', $data);
        echo view('menu');
        echo view('restore_edit', $data);
        echo view('footer');
    }

    public function aksi_restore_edit_user($id)
{
    $model = new M_lelang();
    
    $backupData = $model->getWhere('tb_user_backup', ['id_user' => $id]);

    if ($backupData) {
       
        $restoreData = [
            'username' => $backupData->username,
            'level' => $backupData->level,
           
            // tambahkan field lainnya sesuai dengan struktur tabel menu
        ];
        unset($restoreData['id_user']);
        $model->edit('tb_user', $restoreData, ['id_user' => $id]);
    }
    
    return redirect()->to('home/user');
}


// public function laporan()
//     {
      
//                 $model = new M_lelang;
//                 $where = array('id_setting' => '1');
//                 $data['yogi'] = $model->getWhere1('setting', $where)->getRow();

//                 $id_user = session()->get('id');
//     $activityLog = [
//         'id_user' => $id_user,
//         'menu' => 'Masuk ke Laporan',
//         'time' => date('Y-m-d H:i:s')
//     ];
//     $model->logActivity($activityLog);
//                 echo view('header', $data);
//                 echo view('menu');
//                 echo view('print', $data);
//                 echo view('footer');
           
//     }

    public function laporan() {
        $model = new M_lelang;
    
        // Ambil tanggal awal dan tanggal akhir dari GET parameter
        $tanggal_awal = $this->request->getGet('tanggal_awal');
        $tanggal_akhir = $this->request->getGet('tanggal_akhir');
        
        // Buat kondisi untuk filter berdasarkan tanggal
        $where = [];
        
        if (!empty($tanggal_awal) && !empty($tanggal_akhir)) {
            // Filter berdasarkan rentang tanggal
            $where['tanggal >='] = $tanggal_awal;
            $where['tanggal <='] = $tanggal_akhir;
        }
    
        // Ambil data dari tabel modal_produksi dengan filter tanggal
        $where = array('id_setting' => '1');
        $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
        $id_user = session()->get('id');
        $activityLog = [
            'id_user' => $id_user,
            'menu' => 'Masuk ke Laporan Lelang',
            'time' => date('Y-m-d H:i:s')
        ];
        $model->logActivity($activityLog);
        // Load views
        echo view('header', $data);
        echo view('menu');
        echo view('print', $data); // Pastikan view menerima data produksi
        echo view('footer');
    }
    
    public function windows_print()
    {
        if (session()->get('id') > 0) {
            $model = new M_lelang();
            $id_user = session()->get('id');
    
            // Log aktivitas user
            $activityLog = [
                'id_user' => $id_user,
                'menu' => 'Masuk Ke Window Print',
                'time' => date('Y-m-d H:i:s')
            ];
            $model->logActivity($activityLog);
    
            // Ambil setting untuk keperluan view
            $where = array('id_setting' => '1');
            $data['yogi'] = $model->getWhere1('setting', $where)->getRow();
    
            // Ambil tanggal yang diterima dari parameter GET
            $tanggal_awal = $this->request->getGet('tanggal_awal');
            $tanggal_akhir = $this->request->getGet('tanggal_akhir');


            $data2['lelang'] = $model->carilelang($tanggal_awal, $tanggal_akhir);
    
            // Debugging: Cek apakah data lelang ada
            if (empty($data2['lelang'])) {
                echo "Data lelang tidak ditemukan!";
                return;
            }
    
            // Pass both $data and $data2 to the view
            echo view('header', $data);
            echo view('windows_print', $data2);  // Pass $data2 here
        } else {
            return redirect()->to('home/error');
        }
    }
    
    
    
    

public function setting()
    {
      
                $model = new M_lelang;
                $where = array('id_setting' => '1');
                $data['yogi'] = $model->getWhere1('setting', $where)->getRow();

                $id_user = session()->get('id');
    $activityLog = [
        'id_user' => $id_user,
        'menu' => 'Masuk ke Setting',
        'time' => date('Y-m-d H:i:s')
    ];
    $model->logActivity($activityLog);
                echo view('header', $data);
                echo view('menu');
                echo view('setting', $data);
                echo view('footer');
           
    }

    public function aksi_e_setting()
    {
        $model = new M_lelang();
        // $this->logUserActivity('Melakukan Setting');
        $namaWebsite = $this->request->getPost('namawebsite');
        $id = $this->request->getPost('id');
        $id_user = session()->get('id');
        $where = array('id_setting' => '1');

        $data = array(
            'nama_website' => $namaWebsite,
            'update_by' => $id_user,
            'update_at' => date('Y-m-d H:i:s')
        );

        // Cek apakah ada file yang diupload untuk favicon
        $favicon = $this->request->getFile('img');
        if ($favicon && $favicon->isValid() && !$favicon->hasMoved()) {
            // Beri nama file unik
            $faviconNewName = $favicon->getRandomName();
            // Pindahkan file ke direktori public/images
            $favicon->move(WRITEPATH . '../public/images', $faviconNewName);

            // Tambahkan nama file ke dalam array data
            $data['tab_icon'] = $faviconNewName;
        }

        // Cek apakah ada file yang diupload untuk logo
        $logo = $this->request->getFile('logo');
        if ($logo && $logo->isValid() && !$logo->hasMoved()) {
            // Beri nama file unik
            $logoNewName = $logo->getRandomName();
            // Pindahkan file ke direktori public/images
            $logo->move(WRITEPATH . '../public/images', $logoNewName);

            // Tambahkan nama file ke dalam array data
            $data['logo_website'] = $logoNewName;
        }

        // Cek apakah ada file yang diupload untuk logo
        $login = $this->request->getFile('login');
        if ($login && $login->isValid() && !$login->hasMoved()) {
            // Beri nama file unik
            $loginNewName = $login->getRandomName();
            // Pindahkan file ke direktori public/images
            $login->move(WRITEPATH . '../public/images', $loginNewName);

            // Tambahkan nama file ke dalam array data
            $data['login_icon'] = $loginNewName;
        }

        $model->edit('setting', $data, $where);

        // Optionally set a flash message here
        return redirect()->to('home/setting');
    }


    public function log_activity(){

		$model = new M_lelang;
		$data['users'] = $model->getAllUsers();
	
		$userId = $this->request->getGet('user_id');
	
		// Fetch logs with optional filtering
		if (!empty($userId)) {
			$data['logs'] = $model->getLogsByUser($userId);
		} else {
			$data['logs'] = $model->getLogs();
		}
		$where = array('id_setting' => '1');
		$data['yogi'] = $model->getWhere1('setting', $where)->getRow();
		$id_user = session()->get('id');
		$activityLog = [
			'id_user' => $id_user,
			'menu' => 'Masuk ke Log Activity',
			'time' => date('Y-m-d H:i:s')
		];
		$model->logActivity($activityLog);
		echo view('header', $data);
		echo view('menu');
		echo view('log_activity', $data);
		echo view('footer');
	}







}
