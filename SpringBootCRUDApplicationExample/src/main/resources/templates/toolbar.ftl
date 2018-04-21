<#--  <nav class="navbar navbar-light">
        <div class="container-fluid">
         
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

            <div class="collapse navbar-collapse" id="myNavbar-collapse">
               
                
                <ul class="nav navbar-nav" ng-show="globals.currentUser.username!=null && globals.currentUser.userType == 0">
                    <li><a ui-sref="guest-abstract.guest">Home</a></li>
                    <li><a ui-sref="choice">About</a></li>
                    <li><a ui-sref="guest-abstract.profile-abstract.profile-informations({username:globals.currentUser.username})">Profile</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>


                <div id="sign-up-navbar-right" ng-if="globals.currentUser.username==null">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a  ui-sref="login"> Login</a></li>
                        <li><a  ui-sref="registration"> Sign Up</a></li>
                    </ul>
                </div>
                
                <div >
                    <div id="<li class="nav-item">
        <a class="nav-link" href="#">Cinemas</a>
      </li>" ng-show="globals.currentUser.username!=null">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#" ng-click="baseCtrl.logout()"><span class="fa fa-sign-out" aria-hidden="true"  ></span>Log out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>  -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"><img alt="Brand" ng-src="images/brand" id="brandImg" width="35" height="35"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" ui-sref="guest-abstract.home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" ng-if="globals.currentUser.username!=null" ui-sref="guest-abstract.profile-abstract.profile-overview({username:globals.currentUser.username})">Profile <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" ng-if="globals.currentUser.username!=null && globals.currentUser.userType==0" ui-sref="guest-abstract.reserve">Reserve <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" ui-sref="guest-abstract.cinemas">Cinemas</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" ui-sref="guest-abstract.theatres">Theatres</a>
      </li>
    </ul>
    
    <ul class="navbar-nav ml-auto" ng-if="globals.currentUser.username==null">
      <li class="nav-item">
        <a  class="nav-link" ui-sref="login"><i class="fas fa-sign-in-alt"></i> Login</a>
      </li>
      <li class="nav-item" >
        <a  class="nav-link" ui-sref="registration"><i class="fas fa-user-plus"></i> Sign up</a>
      </li>
      <li class="nav-item" ng-if="globals.currentUser.username!=null">
        <a  class="nav-link" href="#" ng-click="baseCtrl.logout()"><i class="fas fa-sign-out-alt"></i> Log Out</a>
      </li>
    </ul>

    <ul class="navbar-nav ml-auto" ng-if="globals.currentUser.username!=null">
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle"  id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle"></i> {{globals.currentUser.username}}
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" ui-sref="guest-abstract.profile-abstract.profile-overview({username:globals.currentUser.username})">Your profile</a>
          <a class="dropdown-item" ui-sref="guest-abstract.settings-abstract.general({username: globals.currentUser.username})">Settings</a>
          <a  class="dropdown-item" href="#" ng-click="baseCtrl.logout()"><i class="fas fa-sign-out-alt"></i> Log Out</a>
        </div>
      </li>
    </ul>
    <#--  <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>  -->
  </div>
</nav>
    Logged user:
 {{globals.currentUser.username}}
 <br>
 {{globals.currentUser.userType}}
   <div ui-view='choosing'></div>
   <div ui-view='cinemas'></div>
   <div ui-view='theatres'></div>
   <div ui-view='profilePage'></div>
   <div ui-view='settingsPage'></div>
   <div ui-view='reserve'></div>