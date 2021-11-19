    <?php 

session_start();
require 'function.php';
if ( isset($_SESSION["login"])) {
        header("Location: /puskesmas/admin/logout.php");
        exit;
    }

//CEK COOKIE
if ( isset($_COOKIE['id_user']) && isset($_COOKIE['key']) )  {
    $id_user = $_COOKIE['id_user'];
    $key = $_COOKIE['key'];

    $result = mysqli_query($conn, "SELECT email FROM data_petugas WHERE id_user = $id_user");
    $row = mysql_fetch_assoc($result);

    //CEK COOKIRE DAN EMAIL
    if ( $key ===  hash('sha256', $row['email']) ) {
        $_SESSION['login'] = true;
    }
}


	if ( isset($_POST["login"]) ) {
		
        $email = $_POST["email"];
        $password = $_POST["password"];

        $result = mysqli_query($conn, "SELECT * FROM data_petugas WHERE email = '$email'");

        //CEK EMAIL 
        if ( mysqli_num_rows($result) === 1 ) {
            
            //CEK SESSION
            $_SESSION["login"] = true;

            //CEK REMEMBER ME
            if ( isset($_POST['remember']) ) {
                //BUAT COOKIE
                setcookie('id_user', $row['id_user'], time() + 60);
                setcookie('key', hash('sha256', $row['email']), time() + 60);
            }

            //CEK PASSWORD
            $row = mysqli_fetch_assoc($result);
            if (password_verify($password, $row["password"]) ) {

                //CEK LEVEL LOGIN
                
                if ($row['posisi'] == "dokter") {

                    if ( isset($_SESSION["login"]) ) {
                        $_SESSION['email'] = $email;
                        $_SESSION['posisi'] = "dokter";
                        header("location: /puskesmas/dokter/dashboard.php");
                    }

                }  else if ($row['posisi'] == "pegawai") {

                    if ( isset($_SESSION["login"]) ) {
                        $_SESSION['email'] = $email;
                        $_SESSION['posisi'] = "pegawai";
                        header("location: /puskesmas/pendaftaran/dashboard.php");
                    }
                } else if ($row['posisi'] == "lab") {

                    if ( isset($_SESSION["login"]) ) {
                        $_SESSION['email'] = $email;
                        $_SESSION['posisi'] = "lab";
                        header("location: /puskesmas/lab/dashboard.php");
                    }
                } else if ($row['posisi'] == "apotek") {

                    if ( isset($_SESSION["login"]) ) {
                        $_SESSION['email'] = $email;
                        $_SESSION['posisi'] = "apotek";
                        header("location: /puskesmas/apotek/dashboard.php");
                    }
                } else if ($row['posisi'] == "admin") {
                    
                    if ( isset($_SESSION["login"]) ) {
                        $_SESSION["email"] = $email;
                        $_SESSION["posisi"] = "admin";
                        echo "<script>
                                alert('Anda Telah Login Sebagai Admin!');
                                document.location.href = '/puskesmas/admin/dashboard.php';
                                </script>";
                    }

                }


                exit;
            }   
        }

        $error = true;
	}

?>

<!DOCTYPE>
<html>
    <title>Aplikasi Pelayanan Pendaftaran Pasien Puskesmas</title>
    <link rel="stylesheet" type="text/css" href="style/member.css">
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <link href="assets/css/custom.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <style type="text/css">
    	.form ul li {
    		list-style: none;
    		display: block;
    	}
        
    </style>

</head>
<body>
<header id="webhead">
    <div class="container-fluid">
        <div class="row no-gutter">
            <div class="col-md-4 col-xs-9">
                <a href="" class="logo">
                    <h1><img src="style/weblogo.png" class="img-responsive"></h1>
                </a>
            </div>
        </div>
    </div>
</header>

<div class="global">
    <br>
    <div class="panel" align="center" style="background-color: unset;">
        <th align="center" width="70px"><img src="style/LOGO.png" width="65px"></th>
        <th><h1>SIMPUS</h1></th>
        <th><h5>Sistem Informasi Pelayanan Pendaftaran Puskesmas Hamadi</h5></th>
    </div>
    <table width="40%" align="center">
        <tr>
            <td colspan="2">
                <form action="" method="post" class="form">
                        <ul>
                            <?php if( isset($error) ) : ?>
                                <div class="alert alert-danger alert-dismissable">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    Email dan Password Yang Anda Masukan Salah
                                </div>
                            <?php endif; ?>
                            <br>
                            <li>
                                <div class=" form-group input-group-lg">
                                    <input type="text" class="form-control" placeholder="Email" name="email" id="email" autocomplete="off">
                                </div>
                            </li>
                            <br>
                            <li>
                                <div class="form-group input-group-lg">
                                    <input class="form-control" type="password" name="password" id="password" placeholder="Password" autocomplete="off">
                                </div>                                
                            </li>
                            <li>
                                <div class="checkbox">
                                    <input type="checkbox" name="remember" id="remember"> Remember Me
                                </div>
                            </li>
                            <br>
                            <li>
                                <button style="width: 100%;" class="btn btn-success btn-lg" type="submit" name="login"><span class="fa fa-sign-in"></span>&nbsp;Login</button>
                                <p align="center">--------------------  ATAU  --------------------</p>
                                <a style="width: 100%;" href="registrasi.php" class="btn btn-primary btn-lg"><span class="fa fa-registrasi"></span>Registrasi</a>
                            </li>
                        </ul>
                </form>
            </td>
        </tr>
    </table>
</div>
<br>
<br>
<br>
<footer id="copyr">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="inner"> &copy; Mario Cahyo | Pemograman Web Dinamis</div>
            </div>
            <div class="col-md-2">
                <div class="footer-social pull-right">
                    <a href="" target="_blank"><span class="fa fa-facebook"></span></a>
                    <a href="" target="_blank"><span class="fa fa-twitter"></span></a>
                    <a href="" target="_blank"><span class="fa fa-instagram"></span></a>
                    <a href="" target="_blank"><span class="fa fa-linkedin"></span></a>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>