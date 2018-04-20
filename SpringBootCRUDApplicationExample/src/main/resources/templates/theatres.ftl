Theatres: 
<hr>
<div class="container">
    <div class="row">
        <div class="col">
            <div ng-repeat="theatre in theatresCtrl.theatresList">
                <div class="card text-white bg-dark mb-3" style="width: 18rem;">
                    <img class="card-img-top" src="images/cinemas" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title" >{{theatre.name}}
                            <button ng-click="cinemasCtrl.setMarker(theatre.width, theatre.length, theatre.name, theatre.promoDescription)">
                                Show on map
                            </button>
                        </h5>
                        <p class="card-text">{{theatre.promoDescription}}</p>
                        <p class="card-text">{{theatre.adress}}, {{theatre.city}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div my-map="" class="col-8">
        </div>
    </div>
</div>