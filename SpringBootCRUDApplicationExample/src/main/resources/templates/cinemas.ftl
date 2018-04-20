Cinemas: 
<hr>
<div class="container">
    <div class="row">
        <div class="col-3">
            <div class="row" ng-repeat="cinema in cinemasCtrl.cinemasList">
                <div class="card text-white bg-dark mb-3" style="width: 18rem;">
                    <img class="card-img-top" src="images/cinemas" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title" >{{cinema.name}}
                            <button ng-click="cinemasCtrl.enableMarker(cinema)" ng-show="globals.currentUser.userType == '0'">
                                Show on map
                            </button>
                        </h5>
                        <p class="card-text">{{cinema.promoDescription}}</p>
                        <p class="card-text">{{cinema.adress}}, {{cinema.city}}</p>
                    </div>
                </div>
            </div>
        </div>
        <!--{{cinemasCtrl.clickedCinema.width}}
        {{cinemasCtrl.clickedCinema.length}}
        {{cinemasCtrl.showMarker}}-->
        <my-map clickedCinema="clickedCinema" ng-show="globals.currentUser.userType == '0'"> </my-map>
        </div>
    </div>
</div>