<!DOCTYPE html>

<html lang="en" ng-app="crudApp">
    <head>
        <meta http-equiv="expires" content="0">
        <title>${title}</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <link href="css/app.css" rel="stylesheet"/>
        <link href="css/toolbar.css" rel="stylesheet"/>
    </head>
    <body>
        <div ui-view></div>
         
    

        <script src="js/lib/angular.min.js" ></script>
        <script src="js/lib/angular-ui-router.min.js" ></script>
        <script src="js/lib/localforage.min.js" ></script>
        <script src="js/lib/ngStorage.min.js"></script>

        <script src="js/app/modules/app.js"></script>
<!-- Services -->
        <script src="js/app/services/UserService.js"></script>

        <!-- Modules -->
        
        <script src="js/app/modules/authentication/login.js"></script>
        <script src="js/app/modules/authentication/registration.js"></script>
        
        <!-- Controllers -->
        <script src="js/app/controllers/UserController.js"></script>
        <script src="js/app/controllers/authentication/LoginController.js"></script>
        <script src="js/app/controllers/authentication/RegistrationController.js"></script>
      </body>
</html>