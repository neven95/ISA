

<div class="container">
    <div class="row">
        <div class="col-3 float-left " role="navigation">
            <nav class="nav flex-column">
                <a class="nav-link active" ui-sref="guest-abstract.profile-abstract.profile-overview({username:globals.currentUser.username})">
                <i class="fas fa-list-ul"></i> Overview
                </a>
                <a ng-hide="globals.currentUser.userType == '0'" class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-abstract-friends.friends-list({username:globals.currentUser.username})">
                <i class="fas fa-users"></i> Friends
                </a>
                <a ng-show="globals.currentUser.userType == '1'" class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-usersList">
                <i class="fas fa-users"></i> Users
                </a>
                <a ng-show="globals.currentUser.userType == '0'" class="nav-link" ui-sref="guest-abstract.cinemas">
                <i class="fas fa-users"></i> Cinemas
                </a>
                <a ng-show="globals.currentUser.userType == '0'" class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-usersList">
                <i class="fas fa-users"></i> Theatres
                </a>
                <a ng-show="globals.currentUser.userType == '0'" class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-usersList">
                <i class="fas fa-users"></i> Statistics
                </a>
            </nav>
        </div>
        <div class="col-9 float-left">
            <div ui-view='overview'></div>
            <div ui-view='friends'></div>  
            <div ui-view='usersList'></div>  
        </div>
    </div>
</div>
