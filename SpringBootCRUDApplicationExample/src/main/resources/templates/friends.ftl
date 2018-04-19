<div>
<ul class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" ui-sref="guest-abstract.profile-abstract.profile-abstract-friends.friends-list({username:globals.currentUser.username})">Friends</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" ui-sref="guest-abstract.profile-abstract.profile-abstract-friends.friends-search({username:globals.currentUser.username})">Find friends</a>
  </li>
  <#--  <div ui-view='prijateljskaLista'></div>  -->
</ul>
<div ui-view="friendsList"></div>
<div ui-view="friendsSearch"></div>
</div>