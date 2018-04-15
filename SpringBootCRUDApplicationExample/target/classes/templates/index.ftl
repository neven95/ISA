<!DOCTYPE html>

<html lang="en" ng-app="crudApp">
    <head>
        <meta http-equiv="expires" content="0">
        <title>${title}</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <link href="css/app.css" rel="stylesheet"/>
        <link href="css/toolbar.css" rel="stylesheet"/>
        <#--  <script src="js/jquery-3.3.1.min.js"></script>  -->
    </head>
    <body>
        <div ui-view></div>
        {{1+1}}
         
    
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <!--<script src="js/lib/angular.min.js" ></script> -->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="//unpkg.com/@uirouter/angularjs/release/angular-ui-router.min.js"></script>
        <script src="https://code.angularjs.org/1.6.9/angular-cookies.min.js"></script>
       <!-- <script src="js/lib/angular-ui-router.min.js" ></script> -->
        <script src="js/lib/localforage.min.js" ></script>
        <script src="js/lib/ngStorage.min.js"></script>
       
        <script src="js/app/modules/app.js"></script>
        
        <!-- Services -->
        <script src="js/app/services/UserService.js"></script>
        <script src="js/app/services/authentication/AuthenticationService.js"> </script>
        <script src="js/app/services/UserService.js"></script>
        <script src="js/app/services/CinemasService.js"></script>
        
        <!-- Modules -->
        <script src="js/app/modules/authentication/login.js"></script>
        <script src="js/app/modules/authentication/registration.js"></script>
        
        <!-- Controllers -->
        <script src="js/app/controllers/UserController.js"></script>
        <script src="js/app/controllers/successController.js"></script>
        <script src="js/app/controllers/authentication/loginController.js"></script>
        <script src="js/app/controllers/authentication/RegistrationController.js"></script>
        <script src="js/app/controllers/BaseController.js"></script>
        <script src="js/app/controllers/CinemasController.js"></script>
        
         <script type='text/javascript' src='js/lib/bootstrap.js'></script>
      </body>
</html>