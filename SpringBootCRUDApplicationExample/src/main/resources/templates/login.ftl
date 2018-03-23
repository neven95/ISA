<div class="modal-dialog" id="login-modal">
    <div class="modal-content">
        <!--Header-->
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h3 class="modal-title">Log in</h3>
        </div>
        <!--Body-->
        <div class="modal-body">
            <div id="authError" style="display: none">
                <div class="panel panel-danger">
                    <div class="panel-heading">Authentication Error</div>
                    <div class="panel-body">
                        <p class="text-danger">You have entered wrong Username & Password combination!Please try again!</p>
                    </div>
                </div>
            </div>
            <form role="form" name="loginForm">
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Username" ng-pattern="usernamePattern" ng-minlength="3" ng-maxlength="10" ng-required="true" ng-model="$parent.username"></input>
                    <div ng-show="loginForm.username.$touched && (loginForm.username.$error.minlength || loginForm.username.$error.maxlength)">
                        <small style="color:red;display:block;text-align:center;">Username must have anywhere between 3 and 10 characters!</small>
                    </div>
                    <div ng-show="loginForm.username.$touched && loginForm.username.$error.required">
                        <small style="color:red;display:block;text-align:center;">Required!</small>
                    </div>
                    <div ng-show="loginForm.username.$touched && loginForm.username.$error.pattern">
                        <small style="color:red;display:block;text-align:center;">Invalid characters detected!</small>
                    </div>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" ng-pattern="passwordPattern" ng-minlength="8" ng-maxlength="16" ng-required="true" ng-model="$parent.password"></input>
                    <div ng-show="loginForm.password.$touched && (loginForm.password.$error.minlength || loginForm.password.$error.maxlength)">
                        <small style="color:red;display:block;text-align:center;">Password must have anywhere between 8 and 16 characters!</small>
                    </div>
                    <div ng-show="loginForm.password.$touched && loginForm.password.$error.required">
                        <small style="color:red;display:block;text-align:center;">Required!</small>
                    </div>
                    <div ng-show="loginForm.password.$touched && loginForm.password.$error.pattern">
                        <small style="color:red;display:block;text-align:center;">Invalid characters detected!</small>
                    </div>
                </div>
            </form>
        </div>
        <!--Footer-->
        <div class="modal-footer">
            <button class=" btn btn-primary btn-block" ng-disabled="loginForm.$invalid" ng-click="$parent.userLogin()">Log in</button>
        </div>
    </div>
</div>