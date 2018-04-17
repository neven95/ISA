Cinemas: 
<hr>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="row" ng-repeat="cinema in cinemasCtrl.cinemasList">
                <div class="card text-white bg-dark mb-3" style="width: 18rem;">
                    <img class="card-img-top" src="images/cinemas" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title" >{{cinema.name}}
                            <button ng-click="cinemasCtrl.setMarker(my-map, cinema.width, cinema.length, cinema.name, cinema.promoDescription)">
                                Show on map
                            </button>
                        </h5>
                        <p class="card-text">{{cinema.promoDescription}}</p>
                        <p class="card-text">{{cinema.adress}}, {{cinema.city}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-8" my-map="">
        </div>
    </div>
</div>