<div class="container">
    <div class="row">
        <div class="col-3 float-left " role="navigation">
            <nav class="nav flex-column">
                <a class="nav-link active" ui-sref="guest-abstract.settings-abstract.general({username:globals.currentUser.username})">General</a>
                <a class="nav-link" ui-sref="guest-abstract.settings-abstract.security({username:globals.currentUser.username})">Security and Login</a>
            </nav>
        </div>
        <div class="col-9 float-left">
            <div ui-view='general'></div>
            <div ui-view='security'></div>
            
        </div>
    </div>
</div>
