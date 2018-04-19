<!DOCTYPE html>

<html lang="en" ng-app="crudApp">
    <head>
        <meta http-equiv="expires" content="0">
        <title>${title}</title>
        <#--  <link href="css/bootstrap.css" rel="stylesheet"/>  -->
        <link href="css/app.css" rel="stylesheet"/>
        <link href="css/toolbar.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

        <#--  <script src="js/jquery-3.3.1.min.js"></script>  -->
    </head>
    <body>
        <div ui-view></div>
         
    
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!--<script src="js/lib/angular.min.js" ></script> -->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="//unpkg.com/@uirouter/angularjs/release/angular-ui-router.min.js"></script>
        <script src="https://code.angularjs.org/1.6.9/angular-cookies.min.js"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>
       <!-- <script src="js/lib/angular-ui-router.min.js" ></script> -->
        <script src="js/lib/localforage.min.js" ></script>
        <script src="js/lib/ngStorage.min.js"></script>
       
        <script src="js/app/modules/app.js"></script>

        <script src="js/app/services/GoogleMapService.js"></script>

        <!-- Google Map Api -->
        <#--  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.3/angular.min.js"></script>
        <script src="http://maps.googleapis.com/maps/api/js?sensor=false&language=en"></script>  -->
        <script defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAX0VfwVTM6-bKqi2yGRZZinO7ppKGAJBw">
        </script>
    
        <!-- Services -->
        <script src="js/app/services/UserService.js"></script>
        <script src="js/app/services/authentication/AuthenticationService.js"> </script>
        <script src="js/app/services/UserService.js"></script>
        <script src="js/app/services/CinemasService.js"></script>
        <script src="js/app/services/TheatresService.js"></script>
        <script src="js/app/services/FriendsService.js"></script>
        
        <!-- Modules -->
        <script src="js/app/modules/authentication/login.js"></script>
        <script src="js/app/modules/authentication/registration.js"></script>
        
        <!-- Controllers -->
        <script src="js/app/controllers/UserController.js"></script>
         <script src="js/app/controllers/ProfileController.js"></script>
        <script src="js/app/controllers/successController.js"></script>
        <script src="js/app/controllers/authentication/loginController.js"></script>
        <script src="js/app/controllers/authentication/RegistrationController.js"></script>
        <script src="js/app/controllers/BaseController.js"></script>
        <script src="js/app/controllers/CinemasController.js"></script>
        <script src="js/app/controllers/TheatresController.js"></script>
        <script src="js/app/controllers/FriendsController.js"></script>
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
         <#--  <script type='text/javascript' src='js/lib/bootstrap.js'></script>  -->
      </body>
</html>