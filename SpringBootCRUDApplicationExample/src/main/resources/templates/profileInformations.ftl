
<div class="col-md-6 col-md-offset-3">
    <h2>{{profCtrl.userData.firstName}} {{profCtrl.userData.lastName}}</h2>
    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" name="firstName" placeholder="First name" ng-pattern="regCtrl.firstNamePattern" ng-model="profCtrl.userData.firstName" readonly></input>
                        </div>
                        <div class="form-group row">
                            <label for="firstName" class="col-sm-2 col-form-label">First name</label>
                            <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="firstName" value="{{profCtrl.userData.firstName}}">
                            </div>
                        </div>

                        <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@example.com">
    </div>
  </div>

  
                        <div class="form-group">
                            <input type="text" class="form-control" name="lastName" placeholder="Last name" ng-pattern="regCtrl.lastNamePattern" ng-model="profCtrl.userData.lastName" readonly></input>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" name="phoneNumber" placeholder="Phone number" ng-pattern="regCtrl.phonePattern" ng-model="profCtrl.userData.phoneNumber" readonly></input>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control-plaintext" name="city" placeholder="City" ng-model="profCtrl.userData.city" readonly></input>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" ng-pattern="regCtrl.usernamePattern" ng-model="profCtrl.userData.username" readonly></input>

                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="email" placeholder="Email" ng-pattern="regCtrl.emailPattern" ng-model="profCtrl.userData.email" readonly></input>
                        </div>
    </form>
</div>