<div class="modal-dialog">
    <div class="alert alert-success" role="alert" ng-if="regCtrl.successMessage">{{regCtrl.successMessage}}</div>
	<div class="alert alert-danger" role="alert" ng-if="regCtrl.errorMessage">{{regCtrl.errorMessage}}</div>
    <div class="modal-content">
        <!--Header-->
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h3 class="modal-title">Register</h3>
        </div>
        <!--Body-->
        <div class="modal-body">
            <form role="form" name="registerForm" novalidate>

                <div class="media">
                    <div class="media-left">
                        <div class="form-group">

                            <img style="max-height: 250px; max-width: 200px;" ng-src="images/guest" id="profileImg"></img>

                            <input type="button" class="btn btn-primary" style="width: 100%;height: 30px; display: flex;align-items: center;justify-content: center;" value="Load Image" onclick="$('#loadProfileImg').click();" />

                            <input type="file" accept="image/*" class="form-control" id="loadProfileImg"  onchange="angular.element(this).scope().readURL(this);" style="display:none;" name="file" />

                        </div>
                    </div>
                    <div class="media-body">
                        <div class="form-group">
                            <input type="text" class="form-control" name="firstName" placeholder="First name" ng-pattern="regCtrl.firstNamePattern" ng-model="regCtrl.user.firstName" ng-minlength="2" ng-maxlength="20" ng-required="true"></input>
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
                            <input type="text" class="form-control" name="lastName" placeholder="Last name" ng-pattern="regCtrl.lastNamePattern" ng-model="regCtrl.user.lastName" ng-minlength="2" ng-maxlength="20" ng-required="true"></input>
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
                            <input type="text" class="form-control" name="phoneNumber" placeholder="Phone number" ng-pattern="regCtrl.phonePattern" ng-model="regCtrl.user.phoneNumber" ng-minlength="10" ng-maxlength="10" ng-required="true"></input>
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
                <!--  <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="Email" ng-model="user.email" ng-required="true"></input>
                            <div ng-show="registerForm.email.$touched && registerForm.email.$invalid"></div>
                            <div ng-show="registerForm.email.$touched && registerForm.email.$error.required">
                                <small style="color:red;display:block;text-align:center;">Required!</small>
                            </div>
                        </div>-->
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" ng-pattern="regCtrl.usernamePattern" ng-model="regCtrl.user.username" ng-minlength="3" ng-maxlength="10" ng-required="true"></input>
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
                            <input type="text" class="form-control" name="email" placeholder="Email" ng-pattern="regCtrl.emailPattern" ng-model="regCtrl.user.email" ng-minlength="3" ng-maxlength="128" ng-required="true"></input>
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

                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" ng-pattern="regCtrl.passwordPattern" ng-model="regCtrl.user.password" ng-minlength="8" ng-maxlength="16" ng-required="true"></input>
                            <div ng-show="registerForm.password.$touched && (registerForm.password.$error.minlength || registerForm.password.$error.maxlength)">
                                <small style="color:red;display:block;text-align:center;">Password must have anywhere between 8 and 16 characters!</small>
                            </div>
                            <div ng-show="registerForm.password.$touched && registerForm.password.$error.required">
                                <small style="color:red;display:block;text-align:center;">Required!</small>
                            </div>
                            <div ng-show="registerForm.password.$touched && registerForm.password.$error.pattern">
                                <small style="color:red;display:block;text-align:center;">Invalid characters detected!</small>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!--Footer-->
        <div class="modal-footer">
            <button class=" btn btn-primary btn-block" ng-disabled="registerForm.$invalid" ng-click="regCtrl.submit()" > Register </button>
        </div>
    </div>
</div>