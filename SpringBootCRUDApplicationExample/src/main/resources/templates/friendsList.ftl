<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">  
<div class="container bootstrap snippet">

  <div class="header">
    <h3 class="text-muted prj-name">
        <span class="fa fa-users fa-2x principal-title"></span>
        Friends list
    </h3>
  </div>
  <div class="jumbotron list-content" ng-if="friendsCtrl.friendsList.length>0">
    <ul class="list-group">
      <li href="#" class="list-group-item title">
        Your friends list
      </li>
      <li href="#" class="list-group-item text-left" ng-repeat="friend in friendsCtrl.friendsList">
        <img class="img-thumbnail" ng-src="images/user-pic" width='100' height='100'>
        <label class="name">
            {{friend.firstName}} {{friend.lastName}} ({{friend.username}})<br>
        </label>
        <label class="pull-right">
            <button  class="btn btn-danger  btn-xs" ng-click="friendsCtrl.deleteFriend(globals.currentUser.username,friend.id)" title="Delete"> <i class="fas fa-trash-alt"></i></button>
        </label>
        <div class="break"></div>
      </li>
      
    </ul>
  </div>
  <div class="alert alert-warning alert-dismissible fade show" ng-if="!(friendsCtrl.friendsList.length>0)" role="alert">
  <strong>You have no friends!</strong> You should try to find then by typing into search box.
</div>
  </div>
</div>                            