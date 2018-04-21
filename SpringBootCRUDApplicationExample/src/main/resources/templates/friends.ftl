<div>
<#--  <ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" ui-sref="guest-abstract.profile-abstract.profile-abstract-friends.friends-list({username:globals.currentUser.username})">Friends</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-abstract-friends.friends-search({username:globals.currentUser.username})">Find friends</a>
  </li>
</ul>  -->
<#--  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Friends</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-abstract-friends.friends-list({username:globals.currentUser.username})">
        Friends List <span class="sr-only">(current)</span>
        </a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
    <input class="form-control mr-sm-2" type="search" placeholder="Search new friends" aria-label="Search new friends">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  </form>
  </div>
</nav>  -->


<nav class="navbar navbar-expand-lg navbar-light bg-light">
   <span class="navbar-brand mb-0 h1">Friends</span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link"ui-sref="guest-abstract.profile-abstract.profile-abstract-friends.friends-list({username:globals.currentUser.username})">
        Friends List <span class="sr-only">(current)</span>
        </a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" name="searchForm" ng-submit="faCtrl.search()">
      <input class="form-control mr-sm-2" type="search" name="searchNewFriends" ng-model="faCtrl.searchValue" placeholder="Search new friends" aria-label="Search new friends">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<br><br>
<div ui-view="friendsList"></div>
<div ui-view="friendsSearch"></div>
</div>