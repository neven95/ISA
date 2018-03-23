<nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar-collapse  " aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
                <a class="navbar-brand" ui-sref="home">
                        <img alt="Brand" ng-src="images/brand" id="brandImg" width="50" height="50">
                </a>

            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="myNavbar-collapse">
                <!-- Different links are provided for each user -->

                <ul class="nav navbar-nav" ng-show="loggedUser!=null">
                    <li><a ui-sref="user-abstract.user">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
                <ul class="nav navbar-nav" ng-show="loggedUser==null || loggedUser==undefined">
                    <li><a ui-sref="guest-abstract.guest">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>


                <div id="sign-up-navbar-right" ng-if="loggedUser==undefined || loggedUser==null">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a data-toggle="modal" ui-sref="login"> Login</a></li>
                        <li><a data-toggle="modal" ui-sref="registration"> Sign Up</a></li>
                    </ul>
                </div>
                
                <div >
                    <div id="log-out-navbar-right" ng-show="loggedUser!=null">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#" ng-click="userLogout()"><span class="fa fa-sign-out" aria-hidden="true"  ></span>Log out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>

    <div >
        <div class="modal fade" id="login-form" ng-include="par5tials/login">vg</div>
    </div>
 
   <div id="proba"> {{1+1}}</div>