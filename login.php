<?php
// login.php

include('database_connection.php');

$message = '';

if (isset($_POST["login"])) {
    $query = "
    SELECT * FROM user_details
    WHERE user_email = :user_email";

    $statement = $connect->prepare($query);
    $statement -> execute (
        array (
            'user_email' => $_POST["user_email"]
        )
    );

    $count = $statement->rowCount();

    if ($count > 0) {
        if (password_verify($_POST['user_password'], $row['user_password'])) {
            if ($row['user_status'] == 'Active') {
                $_SESSION['type'] = $row['user_type'];
                $_SESSION['user_id'] = $row['user_id'];
                $_SESSION['user_name'] = $row['user_name'];
                header("location:index.php");
            } else {
                $message = "<label> Tu cuenta fue desactivada, por favor contacta con tu admin. </label>"
            }
        } else {
            $message = "<label>¡email o contraseña incorrectos!</label>"
        }
    } else {
        $message = "<label>¡email o contraseña incorrectos!</label>"
    }
}

?>

<!DOCTYPE html>
<html>
    <head>
        <title>UpVent Inventory Management System</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.8/css/mdb.min.css" rel="stylesheet">
    </head>
    <body>
        <br />
        <div class="container">
            <h1 class="h1" align="center"> UpVent Management System </h1>
        </div>
        <br />

        <div class="container">
            <div align="center" class="panel-default panel-heading container">
                <h4 class="h4 mb-4">Por favor inicie sesión para continuar <i class="fas fa-lock"></i></h4>
            </div>
            <div class="container panel-body">
                <form class="text-center border border-light p-5" method="post">
                    <div class="container form-group mb-4">
                        <label>Correo Electrónico  <i class="fas fa-envelope"></i></label>
                        <input type="text" name="user_email" class="form-control" required/>
                    </div>
                    <div class="container form-group mb-4">
                        <label>Contraseña  <i class="fas fa-key"></i></label>
                        <input type="password" name="user_password" class="form-control" required />
                    </div>
                    <div class="container form-group mb-4">
                        <input type="submit" name="login" value="Login" class="btn btn-success" />
                    </div>
                </form>
            </div>
        </div>
       <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.8/js/mdb.min.js"></script>
    </body>
</html>
