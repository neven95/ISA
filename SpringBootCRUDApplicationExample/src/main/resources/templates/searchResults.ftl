<li href="#" class="list-group-item text-left" ng-repeat="result in resultsCtrl.searchResults">
    <img class="img-thumbnail" ng-src="images/user-pic" width='100' height='100'>
    <label class="name">
            {{result.firstName}} {{result.lastName}} ({{result.username}})<br>
    </label>
    <label class="pull-right">
        <a  class="btn btn-success btn-xs" href="#" title="View"><i class="fas fa-user-plus"></i></a>
    </label>
    <div class="break"></div>
</li>