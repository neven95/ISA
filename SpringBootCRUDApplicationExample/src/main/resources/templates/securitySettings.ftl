<h2>Update profile</h2>
<form name="form" ng-submit="securityCtrl.securitySubmit()" role="form">
  <div class="form-group" >
    <label for="currentPassword">Enter your current password</label>
    <input type="password" name="currentPassword" class="form-control" id="currentPassword" ng-model="securityCtrl.currentPassword" placeholder="Current password">
    <span ng-show="form.currentPassword.$dirty && form.currentPassword.$error.required" class="help-block">Enter current password</span>
    <small style="color:red;display:block;text-align:center;" ng-show="!securityCtrl.correctPassword" class="help-block">Enter correct password</small>
     
  </div>
  <hr>
  <div class="form-group" >
    <label for="newPassword">Your new password</label>
    <input type="password" name="newPassword" class="form-control" id="newPassword" ng-model="securityCtrl.newPassword" placeholder="New password">
    <small style="color:red;display:block;text-align:center;"  ng-show="form.currentPassword.$dirty && form.currentPassword.$error.required" class="help-block">Password is required</small>
  </div>
  <div class="form-group" >
    <label for="repeatPassword">Repeat password</label>
    <input type="password" name="newPassword" class="form-control" id="repeatPassword" ng-model="securityCtrl.repeatPassword" placeholder="Repeat password">
    <small style="color:red;display:block;text-align:center;" ng-show="form.newPassword.$dirty && form.newPassword.$error.required" class="help-block">Password is required</small>
    <small style="color:red;display:block;text-align:center;" ng-show="securityCtrl.passwordDoNotMatch" class="help-block">Passwords do not match</small>
    <small style="color:green;display:block;text-align:center;" ng-show="securityCtrl.passwordMatch" class="help-block">Passwords match</small>
  </div>
  <div class="form-actions">
            <button type="submit" ng-disabled="form.$invalid || securityCtrl.dataLoading" class="btn btn-primary">Reset password</button>
            <img ng-if="securityCtrl.dataLoading" src="data:image/gif;base64,R0lGODlhEAAQAPIAAP///wAAAMLCwkJCQgAAAGJiYoKCgpKSkiH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCgAAACwAAAAAEAAQAAADMwi63P4wyklrE2MIOggZnAdOmGYJRbExwroUmcG2LmDEwnHQLVsYOd2mBzkYDAdKa+dIAAAh+QQJCgAAACwAAAAAEAAQAAADNAi63P5OjCEgG4QMu7DmikRxQlFUYDEZIGBMRVsaqHwctXXf7WEYB4Ag1xjihkMZsiUkKhIAIfkECQoAAAAsAAAAABAAEAAAAzYIujIjK8pByJDMlFYvBoVjHA70GU7xSUJhmKtwHPAKzLO9HMaoKwJZ7Rf8AYPDDzKpZBqfvwQAIfkECQoAAAAsAAAAABAAEAAAAzMIumIlK8oyhpHsnFZfhYumCYUhDAQxRIdhHBGqRoKw0R8DYlJd8z0fMDgsGo/IpHI5TAAAIfkECQoAAAAsAAAAABAAEAAAAzIIunInK0rnZBTwGPNMgQwmdsNgXGJUlIWEuR5oWUIpz8pAEAMe6TwfwyYsGo/IpFKSAAAh+QQJCgAAACwAAAAAEAAQAAADMwi6IMKQORfjdOe82p4wGccc4CEuQradylesojEMBgsUc2G7sDX3lQGBMLAJibufbSlKAAAh+QQJCgAAACwAAAAAEAAQAAADMgi63P7wCRHZnFVdmgHu2nFwlWCI3WGc3TSWhUFGxTAUkGCbtgENBMJAEJsxgMLWzpEAACH5BAkKAAAALAAAAAAQABAAAAMyCLrc/jDKSatlQtScKdceCAjDII7HcQ4EMTCpyrCuUBjCYRgHVtqlAiB1YhiCnlsRkAAAOwAAAAAAAAAAAA==" />
        </div>
</form>