<#--  
<div class="container">
    <div class="row">
        <div class="col-4 ">
            <div class="list-group" id="myList" role="tablist">
                <a class="list-group-item list-group-item-action active" data-toggle="list" href="#home" role="tab">Home</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Profile</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Messages</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Settings</a>
            </div>
        <div>
        <div class="col-8 ">
            <div ui-view='editProfile'></div>
            <div ui-view='friends'></div>
        <div>
    </div>
</div>  -->
<#--  <div class="container">
    <div class="row">
        <div class="col-3 float-left pr-4" role="navigation">
            <div class="list-group" id="list-tab" role="tablist">
            <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" ui-sref="guest-abstract.profile-abstract.profile-informations({username:globals.currentUser.username})" role="tab" aria-controls="informations">Informations</a>
            <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" ui-sref="guest-abstract.profile-abstract.profile-friends({username:globals.currentUser.username})" role="tab" aria-controls="friends">Friends</a>
            <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" ui-sref="guest-abstract.profile-abstract.profile-settings({username:globals.currentUser.username})" role="tab" aria-controls="settings">Settings</a>
            <#--  <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>  -->
    <!--        </div>
        </div>
        <div class="col-9 float-left">
            <div ui-view='informations'></div>
            <div ui-view='friends'></div>
            <div ui-view='settings'></div>
        </div>
    </div>
</div>  -->


<div class="container">
    <div class="row">
        <div class="col-3 float-left " role="navigation">
            <nav class="nav flex-column">
                <a class="nav-link active" ui-sref="guest-abstract.profile-abstract.profile-overview({username:globals.currentUser.username})">
                <i class="fas fa-list-ul"></i> Overview
                </a>
                <a class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-friends({username:globals.currentUser.username})">
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
