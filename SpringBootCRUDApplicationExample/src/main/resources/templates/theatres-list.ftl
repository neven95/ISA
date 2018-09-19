<div class="list-group" >
  <a href="#" class="list-group-item list-group-item-action flex-column align-items-start" ng-repeat="co in coCtrl.culturalObjects">
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">{{co.name}}</h5>
      <small>{{co.type}}</small>
    </div>
    <p class="mb-1">{{co.promoDescription}}</p>
    <small>City:{{co.city}}<br> Adress:{{co.adress}}</small>
  </a>
</div>