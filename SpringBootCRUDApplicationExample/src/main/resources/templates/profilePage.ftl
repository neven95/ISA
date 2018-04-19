

<div class="container">
    <div class="row">
        <div class="col-3 float-left " role="navigation">
            <nav class="nav flex-column">
                <a class="nav-link active" ui-sref="guest-abstract.profile-abstract.profile-overview({username:globals.currentUser.username})">
                <i class="fas fa-list-ul"></i> Overview
                </a>
                <a class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-abstract-friends.friends-list({username:globals.currentUser.username})">
                <i class="fas fa-users"></i> Friends
                </a>
            </nav>
        </div>
        <div class="col-9 float-left">
            <div ui-view='overview'></div>
            <div ui-view='friends'></div>
            
        </div>
    </div>
</div>
