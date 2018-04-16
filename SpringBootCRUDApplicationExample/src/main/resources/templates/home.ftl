<div class="container justify-content-md-center" >
          <div class="row ">
            <div class="spacing">

            </div>
        </div> 
        <div class="row justify-content-around">
            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" ng-src="images/cinemas" width="286" height="180"  alt="Cinemas image">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a ng-click='chooseCtrl.toCinemas()' class="btn btn-primary">Go to Cinemas</a>
                    </div>
                </div>
            </div>

            <div class="col-4">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" ng-src="images/theaters" width="286" height="180" alt="Card image cap">
                    <div class="card-body">
                          <h5 class="card-title">Theaters</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a ng-click='chooseCtrl.toTheatres()' class="btn btn-primary">Go to Theaters</a>
                    </div>
                </div>
            </div>
        </div>
    </div>