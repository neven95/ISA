<div class="container-fluid" ng-controller="UserController">
        <div class="row">
            <div class="spacing">

            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-2 ">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top card-img" ng-src="images/cinemas" width="286" height="180" alt="Card image cap">
                    <div class="card-body">
                          <h5 class="card-title">Cinemas</h5> 
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a ng-click='chooseCtrl.toCinemas()' class="btn btn-primary">Go to Cinemas</a>
                    </div>
                </div>
            </div>

            <div class="col-md-2 col-md-offset-2 ">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" ng-src="images/theaters" width="286" height="180" alt="Card image cap">
                    <div class="card-body">
                          <h5 class="card-title">Theaters</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go to Theaters</a>
                    </div>
                </div>
            </div>
        </div>
    </div>