<div class="alert alert-success" role="alert" ng-if="regUsersCtrl.successMessage">{{regUsersCtrl.successMessage}}</div>
<div class="alert alert-danger" role="alert" ng-if="regUsersCtrl.errorMessage">{{regUsersCtrl.errorMessage}}</div>

<form name="registerObjectForm" ng-submit="regUsersCtrl.submit()" role="form">
    <div class="container">
        <div class="form-group">
            <div class="form-group col-md-4">
                <label for="inputName">Name</label>
                <input type="text" ng-pattern="regUsersCtrl.namePattern" ng-model="regUsersCtrl.object.name" ng-required="true" class="form-control" id="inputName" placeholder="Name">
            </div>
        </div>
        <div class="form-group">
            <div class="container">
                <div class="row">
                    <div class="form-group col-md-2">
                        <label for="inputLongitude">Longitude</label>
                        <input type="text" ng-pattern="regUsersCtrl.lonlatPattern" ng-model="regUsersCtrl.object.width" ng-required="true" class="form-control" id="inputLongitude" placeholder="0.00000">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputLatitude">Latitude</label>
                        <input type="text" ng-pattern="regUsersCtrl.lonlatPattern" ng-model="regUsersCtrl.object.length" ng-required="true" class="form-control" id="inputLatitude" placeholder="0.00000">
                    </div>
                </div>    
            </div>
        </div>
        <div class="form-group">
            <div class="form-group col-md-5">
                <label for="inputAddress">Address</label>
                <input type="text" ng-required="true" ng-model="regUsersCtrl.object.adress" class="form-control" id="inputAddress" placeholder="1234 Main St">
            </div>
        </div>
        <div class="form-group">
            <div class="form-group col-md-5">
                <label for="inputDescription">Promo description</label>
                <input type="text" ng-required="true" ng-model="regUsersCtrl.object.promoDescription" class="form-control" id="inputDescription" placeholder="Description">
            </div>
        </div>
        <div class="form-group col-md-5">
            <label for="inputCity">City</label>
            <input type="text" ng-required="true" ng-model="regUsersCtrl.object.city" class="form-control" id="inputCity" placeholder="City">
        </div>
        <div class="form-group">
            <div class="container">
                <div class="row">
                    <div class="form-group col-md-3">
                        <label for="inputAdmin">Assign admin</label>
                        <select id="inputAdmin" ng-model="regUsersCtrl.object.admin" class="form-control">
                            <option ng-repeat="user in regUsersCtrl.users" ng-value="user">
                                {{user.username}}
                            </option>
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputObjectType">Object type</label>
                        <select id="inputObjectType" ng-model="regUsersCtrl.object.type" class="form-control">
                            <option selected>Cinema</option>
                            <option>Theatre</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </div>
    </div>
</form>