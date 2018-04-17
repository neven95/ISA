Theatres: 
<ht>
<div ng-repeat="theatre in theatresCtrl.theatresList">
   <div class="card text-white bg-dark mb-3" style="width: 18rem;">
        <img class="card-img-top" src="images/cinemas" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">{{theatre.name}}</h5>
            <p class="card-text">{{theatre.promoDescription}}</p>
            <p class="card-text">{{theatre.adress}}, {{cinema.city}}</p>
        </div>
    </div>
</div>