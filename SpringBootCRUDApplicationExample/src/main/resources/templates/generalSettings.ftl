<div class="alert alert-success" role="alert" ng-if="settingsCtrl.successMessage">{{settingsCtrl.successMessage}}</div>
<div class="alert alert-danger" role="alert" ng-if="settingsCtrl.errorMessage">{{settingsCtrl.errorMessage}}</div>
<div class="col-md-6 col-md-offset-3">
    <h2>Sign Up</h2>
    <form name="registerForm" ng-submit="settingsCtrl.submit()" role="form">
                        <div class="form-group">
                            <input type="text" class="form-control" name="firstName" placeholder="First name" ng-pattern="settingsCtrl.firstNamePattern" ng-model="settingsCtrl.userData.firstName" ng-minlength="2" ng-maxlength="20" ng-required="true"></input>
                            <div ng-show="registerForm.firstName.$touched && registerForm.firstName.$error.minlength">
                                <small style="color:red;display:block;text-align:center;">Name you have entered is too small!</small>
                            </div>
                            <div ng-show="registerForm.firstName.$touched && registerForm.firstName.$error.maxlength">
                                <small style="color:red;display:block;text-align:center;">Name you have entered is too large!</small>
                            </div>
                            <div ng-show="registerForm.firstName.$touched && registerForm.firstName.$error.required">
                                <small style="color:red;display:block;text-align:center;">Required!</small>
                            </div>
                            <div ng-show="registerForm.firstName.$touched && registerForm.firstName.$error.pattern">
                                <small style="color:red;display:block;text-align:center;">Invalid characters detected!</small>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" name="lastName" placeholder="Last name" ng-pattern="settingsCtrl.lastNamePattern" ng-model="settingsCtrl.userData.lastName" ng-minlength="2" ng-maxlength="20" ng-required="true"></input>
                            <div ng-show="registerForm.lastName.$touched && registerForm.lastName.$error.minlength">
                                <small style="color:red;display:block;text-align:center;">Last name you have entered is too small!</small>
                            </div>
                            <div ng-show="registerForm.lastName.$touched && registerForm.lastName.$error.maxlength">
                                <small style="color:red;display:block;text-align:center;">Last name you have entered is too large!</small>
                            </div>
                            <div ng-show="registerForm.lastName.$touched && registerForm.lastName.$error.required">
                                <small style="color:red;display:block;text-align:center;">Required!</small>
                            </div>
                            <div ng-show="registerForm.lastName.$touched && registerForm.lastName.$error.pattern">
                                <small style="color:red;display:block;text-align:center;">Invalid characters detected!</small>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" name="phoneNumber" placeholder="Phone number" ng-pattern="settingsCtrl.phonePattern" ng-model="settingsCtrl.userData.phoneNumber" ng-minlength="10" ng-maxlength="10" ng-required="true"></input>
                            <div ng-show="registerForm.phoneNumber.$touched && (registerForm.phoneNumber.$error.minlength || registerForm.phoneNumber.$error.maxlength) && !registerForm.phoneNumber.$error.pattern ">
                                <small style="color:red;display:block;text-align:center;">Enter a valid phone number!</small>
                            </div>
                            <div ng-show="registerForm.phoneNumber.$touched && (registerForm.phoneNumber.$error.pattern)">
                                <small style="color:red;display:block;text-align:center;">Invalid characters detected!</small>
                            </div>
                            <div ng-show="registerForm.phoneNumber.$touched && registerForm.phoneNumber.$error.required">
                                <small style="color:red;display:block;text-align:center;">Required!</small>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" name="city" placeholder="City" ng-model="settingsCtrl.userData.city" ng-required="true"></input>
                            <div ng-show="registerForm.city.$touched && registerForm.city.$invalid"></div>
                            <div ng-show="registerForm.city.$touched && registerForm.city.$error.required">
                                <small style="color:red;display:block;text-align:center;">Required!</small>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" ng-pattern="settingsCtrl.usernamePattern" ng-model="settingsCtrl.userData.username" ng-minlength="3" ng-maxlength="10" ng-required="true"></input>
                            <div ng-show="registerForm.username.$touched && (registerForm.username.$error.minlength || registerForm.username.$error.maxlength)">
                                <small style="color:red;display:block;text-align:center;">Username must have anywhere between 3 and 10 characters!</small>
                            </div>
                            <div ng-show="registerForm.username.$touched && registerForm.username.$error.required">
                                <small style="color:red;display:block;text-align:center;">Required!</small>
                            </div>
                            <div ng-show="registerForm.username.$touched && registerForm.username.$error.pattern">
                                <small style="color:red;display:block;text-align:center;">Invalid characters detected!</small>
                            </div>

                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="email" placeholder="Email" ng-pattern="settingsCtrl.emailPattern" ng-model="settingsCtrl.userData.email" ng-minlength="3" ng-maxlength="128" ng-required="true"></input>
                            <div ng-show="registerForm.email.$touched && (registerForm.email.$error.minlength || registerForm.email.$error.maxlength)">
                                <small style="color:red;display:block;text-align:center;">Username must have anywhere between 3 and 128 characters!</small>
                            </div>
                            <div ng-show="registerForm.email.$touched && registerForm.email.$error.required">
                                <small style="color:red;display:block;text-align:center;">Required!</small>
                            </div>
                            <div ng-show="registerForm.email.$touched && registerForm.email.$error.pattern">
                                <small style="color:red;display:block;text-align:center;">Invalid characters detected!</small>
                            </div>
                        </div>
        <div class="form-actions">
            <button type="submit" ng-disabled="form.$invalid || settingsCtrl.dataLoading" class="btn btn-primary">Sign Up</button>
            <img ng-if="settingsCtrl.dataLoading" src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQgAAAGJiYoKCgpKSkiH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCgAAACwAAAAAEAAQAAADMwi63P4wyklrE2MIOggZnAdOmGYJRbExwroUmcG2LmDEwnHQLVsYOd2mBzkYDAdKa+dIAAAh+QQJCgAAACwAAAAAEAAQAAADNAi63P5OjCEgG4QMu7DmikRxQlFUYDEZIGBMRVsaqHwctXXf7WEYB4Ag1xjihkMZsiUkKhIAIfkECQoAAAAsAAAAABAAEAAAAzYIujIjK8pByJDMlFYvBoVjHA70GU7xSUJhmKtwHPAKzLO9HMaoKwJZ7Rf8AYPDDzKpZBqfvwQAIfkECQoAAAAsAAAAABAAEAAAAzMIumIlK8oyhpHsnFZfhYumCYUhDAQxRIdhHBGqRoKw0R8DYlJd8z0fMDgsGo/IpHI5TAAAIfkECQoAAAAsAAAAABAAEAAAAzIIunInK0rnZBTwGPNMgQwmdsNgXGJUlIWEuR5oWUIpz8pAEAMe6TwfwyYsGo/IpFKSAAAh+QQJCgAAACwAAAAAEAAQAAADMwi6IMKQORfjdOe82p4wGccc4CEuQradylesojEMBgsUc2G7sDX3lQGBMLAJibufbSlKAAAh+QQJCgAAACwAAAAAEAAQAAADMgi63P7wCRHZnFVdmgHu2nFwlWCI3WGc3TSWhUFGxTAUkGCbtgENBMJAEJsxgMLWzpEAACH5BAkKAAAALAAAAAAQABAAAAMyCLrc/jDKSatlQtScKdceCAjDII7HcQ4EMTCpyrCuUBjCYRgHVtqlAiB1YhiCnlsRkAAAOwAAAAAAAAAAAA==" />
        </div>
    </form>
</div>

{{settingsCtrl.userData}}