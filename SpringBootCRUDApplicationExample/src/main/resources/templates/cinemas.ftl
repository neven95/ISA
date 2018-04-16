Cinemas: 
<hr>  
<div ng-repeat="cinema in cinemasCtrl.cinemasList">
    <div class="card text-white bg-dark mb-3" style="width: 18rem;">
        <img class="card-img-top" src="images/cinemas" alt="Card image cap">
        <div class="card-body">
            <a href="#"><h5 class="card-title">{{cinema.name}}</h5></a>
            <p class="card-text">{{cinema.promoDescription}}</p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">{{cinema.adress}}</li>
            <li class="list-group-item">{{cinema.city}}</li>
        </ul>
    </div>
</div>